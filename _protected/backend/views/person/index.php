<?php

use yii\helpers\Html;
use yii\grid\GridView;
//
use yii\widgets\Pjax;


/* @var $this yii\web\View */
/* @var $searchModel backend\models\PersonSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'บุคลากร';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="person-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('สร้างใหม่', ['create'], ['class' => 'btn btn-success']) ?>&nbsp;|&nbsp;
        <?= Html::a('รายงาน', ['pdf'], ['class' => 'btn btn-primary'],['target'=>'_blank','class' => 'linksWithTarget']) ?>&nbsp;|&nbsp;
         <?= Html::a('ExExcel-บุคลากร', ['export'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(['enablePushState' => false]); ?>
    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            //'person_id', join
            [
                'attribute' => 'person_id',
                'value' => 'person_id',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
            ],
            //'prefix_id', join
            [
                'attribute' => 'prefix',
                'value' => 'prefix.prefix_name',
                //  'filter' => ['นาย','นาง','นางสาว'], //Array
               //    'filter' => \backend\models\PersonSearch::getPrefixName(), //Table
                'filter' => Html::activeDropDownList($searchModel, 'prefix', \backend\models\Person::getPrefixName(),
                    ['class' => 'form-control','prompt' => '--กรุณาเลือกรายการ--']),
                
             /* 'filter' =>  Html::activeDropDownList($searchModel, 'prefix', ArrayHelper::map(Prefix::find()->asArray()->all(), 
                        'prefix_id', 'prefix_name'),['class'=>'form-control','prompt' => 'Select Category']),
               */ 
            ],
            'person_firstname',
            'person_lastname',
            //comment  'person_date_work_start',
            //'position.position_name'
            [
                'attribute' => 'position',
                'value' => 'position.position_name',
            ],
            //'department.department_name',
            [
                'attribute' => 'department',
                'value' => 'department.department_name',
            ],
            // 'position_id',
            // 'department_id',
            // 'person_address',
            // 'person_tel',
            // 'person_picture',
            // 'person_work_status',
            //
            [
                'attribute' => 'person_work_status',
                'content' => function($model, $key, $index, $column) {
                    return $model->person_work_status == 0 ? '<i class="fa fa-check"></i>' : '<i class="fa fa-close"></i>';
                },
            //
            /*  'value' => function($model, $key, $index, $column){
              $status = "";
              if($model->person_work_status == 0){
              $status = "ทำงานอยู่";
              }else if($model->person_work_status == 1){
              $status = "ลาออก";
              }else{
              $status = "ลาพักผ่อน";
              }
              return $status;
              } */
            ],
            ['class' => 'yii\grid\ActionColumn',
                //
                'header' => 'เครื่องมือ',
                'headerOptions' => ['width' => '100'],
                'template' => '{view}{update}{delete}',
                'buttons' => [
                    'view' => function($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-search"></span>', $url, ['title' => 'ดูรายละเอียด']);
                    },
                            'delete' => function($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-remove"></span>', $url, ['title' => 'ลบรายการ',
                                    'data' => ['confirm' => 'แน่ใจว่าต้องการลยรายการนี้?', 'method' => 'post']]);
                    }
                        ],
                    ],
                ],
            ]);
            ?>
            <?php Pjax::end(); ?>
</div>
