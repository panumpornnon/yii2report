<?php
use yii\helpers\Html;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$this->title = 'รวมรายงาน';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="person-index">
      <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('รายงานที่1', ['report1'], ['class' => 'btn btn-success']) ?>&nbsp;|&nbsp;
        <?= Html::a('รายงานที่2', ['report2'], ['class' => 'btn btn-primary'], ['target' => '_blank', 'class' => 'linksWithTarget']) ?>&nbsp;|&nbsp;
        <?= Html::a('รายงานที่3', ['report3'], ['class' => 'btn btn-success']) ?>
    </p>
</div>