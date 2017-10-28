<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */
/* @var $role common\rbac\models\Role */

$this->title = Yii::t('app', 'ข้อมูลผู้ใช้');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ผู้ใช้ทั้งหมด'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="user-create">

<!---->
<div class="row">
<div class="col-lg-6">
<!---->

<div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">เพิ่มผู้ใช้ใหม่</h3>
          <div class="box-tools pull-right">
            <!-- Buttons, labels, and many other things can be placed here! -->
            <!-- Here is a label for example -->
            <span class="label label-primary">Label</span>
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
          <?= $this->render('_form',[
			'user'=> $user,
			'role' => $role,
		  ])?>
		  
        </div><!-- /.box-body -->
        <div class="box-footer">
			เป็นการเพิ่มผู้ใช้ในระบบใหม่
        </div><!-- box-footer -->
      </div><!-- /.box -->
<!---->
</div>
</div>
<!---->
	 
	  
	  
	<!--
    <h1><?//= Html::encode($this->title) ?></h1>

    <div class="col-lg-5 well bs-component">

        <?/*= $this->render('_form', [
            'user' => $user,
            'role' => $role,
        ])*/ ?>

    </div>
	-->

</div>

