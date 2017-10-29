<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use yii\grid\GridView;
use yii\helpers\Url;
?>

<div class="person-index">
    <div class="text-center">
        <img src="<?= Url::to(Yii::getAlias('@uploads') . '/logo.jpg'); ?>" width="90">
    </div>
    <h1 class="text-center">รายงานบุคลากร ทั้งหมดจํานวน <?= $dataProvider->getTotalCount(); ?> คน</h1>
    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'person_id',
                'value' => 'person_id',
                'contentOptions' => ['class' => 'text-center'],
                'headerOptions' => ['class' => 'text-center'],
            ],
            'person_firstname',
            'person_lastname',
        ],
    ]);
    ?>
</div>
