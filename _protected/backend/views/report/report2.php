<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
use yii\helpers\Html;

use miloschuman\highcharts\Highcharts;

$this->title = 'รายงาน จํานวนบุคลากรแยกตามแผนก';
?>
<p>
        <?= Html::a('รายงานที่1', ['report1'], ['class' => 'btn btn-success']) ?>&nbsp;|&nbsp;
        <?= Html::a('รายงานที่3', ['report3'], ['class' => 'btn btn-success']) ?>
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
//print_r($department);
//print_r($count);
                $cat = array();
                foreach ($department as $value) {
                    $cat[] = $value['department_name'];
                }
                $data = array();
                foreach ($count as $value) {
                    $data[] = intval($value['countperson']);
                }
                /* $data = array();
                  foreach ($count as $value) {
                  $data[] = $value['countperson'];
                  }
                  $data = array_map('intval', $data); */
                echo Highcharts::widget([
                    'options' => [
                        'title' => ['text' => 'รายงานจํานวนบุคลากร'],
                        'subtitle' => ['text' => 'รายงานจํานวนบุคลากรแยกตามแผนก'],
                        'credits' => ['enabled' => false],
                        'legend' => [
                            'align' => 'right',
                            'verticalAlign' => 'middle',
                            'layout' => 'vertical',
                            'borderWidth' => 2,
                            'borderRadius' => 3,
                        ],
                        'xAxis' => [
                            'title' => ['text' => 'แผนก'],
                            'categories' => $cat,
                        ],
                        'yAxis' => [
                            'title' => ['text' => 'จํานวนพนักงาน']
                        ],
                        'series' => [
                            [
                                'lineWidth' => 5,
                                'name' => 'จํานวนพนักงาน',
                                'data' => $data,
                                'dataLabels' => [
                                    'enabled' => true,
                                    'x' => -5,
                                    'y' => 30,
                                ]
                            ],
                        ],
                    ]
                ]);
                ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                The footer of the box
            </div><!-- box-footer -->
        </div><!-- /.box -->
    </div>
</div> 