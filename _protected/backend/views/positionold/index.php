<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = Yii::t('app', 'ตำแหน่ง ทั้งหมด'.Html::encode($count).' รายการ');
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a('ExExcel-ตำแหน่ง', ['export'], ['class' => 'btn btn-primary'],['target'=>'_blank','class' => 'linksWithTarget']) ?>&nbsp;|&nbsp;
    <?= Html::a('ImExcel_ตำแหน่ง', ['import'], ['class' => 'btn btn-primary'],['target'=>'_blank','class' => 'linksWithTarget']) ?>
</p>

<div class="row">
<div class="col-md-6">
<table class="table table-hover">
<tr>
<th>รหัส</th>
<th>ชื่อตำแหน่ง</th>
<th>ลบ</th>
</tr>
<?php foreach ($positions as $position): ?>
<tr>
<td><?= Html::encode($position['position_id']); ?></td>
<td><?= Html::encode($position['position_name']); ?></td>
<td><a href="<?= Url::to(['department/delete','id'=>Html::encode($position['position_id']) ]); ?>"><span 
class="fa fa-trash"></span></a></td>
</tr>
<?php endforeach; ?>
</table>
</div>
</div>