<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$this->title= Yii::t('app','ตำแหน่ง');
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= \yii\grid\GridView::widget([
        'dataProvider'=>$dataProvider,
        'columns'=>[
            'position_id','position_name',
        ]
    ]);?>
</p>