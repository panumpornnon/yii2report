<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Person */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="person-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'person_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'prefix_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_firstname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_lastname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_date_work_start')->textInput() ?>

    <?= $form->field($model, 'position_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'department_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_picture')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person_work_status')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
