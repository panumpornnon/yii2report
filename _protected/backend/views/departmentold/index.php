<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = Yii::t('app', 'แผนก ทั้งหมด'.Html::encode($count).' รายการ');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
<div class="col-md-6">
<table class="table table-hover">
<tr>
<th>รหัส</th>
<th>แผนก</th>
<th>ลบ</th>
</tr>
<?php foreach ($departments as $department): ?>
<tr>
<td><?= Html::encode($department['department_id']); ?></td>
<td><?= Html::encode($department['department_name']); ?></td>
<td><a href="<?= Url::to(['department/delete','id'=>Html::encode($department['department_id']) ]); ?>"><span 
class="fa fa-trash"></span></a></td>
</tr>
<?php endforeach; ?>
</table>
</div>
</div>