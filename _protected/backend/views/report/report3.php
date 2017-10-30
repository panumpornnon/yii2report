<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use yii\helpers\Html;

use miloschuman\highcharts\Highcharts;
use yii\web\JsExpression;

$this->title = 'รายงาน จํานวนบุคลากรแยกตามตําแหน่ง';
?>
<p>
        <?= Html::a('รายงานที่1', ['report1'], ['class' => 'btn btn-success']) ?>&nbsp;|&nbsp;
        <?= Html::a('รายงานที่2', ['report2'], ['class' => 'btn btn-primary'], ['target' => '_blank', 'class' => 'linksWithTarget']) ?>

    </p>
<div class="row">
    <div class="col-md-12">
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Default Box Example</h3>
                <div class="box-tools pull-right">
                    <!-- Buttons, labels, and many other things can be placed here! -->
                    <!-- Here is a label for example -->
                    <span class="label label-primary">Label</span>
                </div><!-- /.box-tools -->
            </div><!-- /.box-header -->
            <div class="box-body">
                <?php
//echo print_r($data);
                $posData = array();
                foreach ($data as $value) {
                    extract($value);
                    $posData[] = array($value['position_name'], intval($value['count']));
                }
                echo Highcharts::widget([
                    'scripts' => [
                        'highcharts-3d',
                    ],
                    'options' => [
                        'chart' => [
                            'type' => 'pie',
                            'borderWidth' => 1,
                            'borderRadius' => 5,
                            'options3d' => [
                                'enabled' => true,
                                'alpha' => 55,
                                'beta' => 0,
                            ]
                        ],
                        'plotOptions' => [
                            'pie' => [ 'depth' => 50, // 3d
                                'showInLegend' => true,
                                'dataLabels' => [
                                    'distance' => -50,
                                    'style' => [
                                        'fontWeight' => 'bold',
                                        'width' => '140px',
                                    ],
                                    'formatter' => new JsExpression('function() { return this.point.name +" "+ 
Highcharts.numberFormat(this.y,0) + " คน"  }'),
                                ]
                            ]
                        ],
                        'title' => ['text' => 'รายงานจํานวนบุคลากร'],
                        'subtitle' => ['text' => 'รายงานจํานวนบุคลากรแยกตําแหน่ง'],
                        'credits' => ['enabled' => true],
                        'legend' => [
                            'align' => 'right',
                            'verticalAlign' => 'middle',
                            'layout' => 'vertical',
                            'borderWidth' => 2,
                            'borderRadius' => 3,
                        ],
                        'series' => [
                            [
                                'name' => 'จํานวนพนักงาน',
                                'data' => $posData,
                            ],
                        ],
            ]]);
                ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                The footer of the box
            </div><!-- box-footer -->
        </div><!-- /.box -->
    </div>
</div>