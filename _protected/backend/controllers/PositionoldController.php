<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace backend\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use Yii;
use yii\data\SqlDataProvider;
use backend\models\Position; //for export excel

/**

 * Site controller.
 * It is responsible for displaying static pagec, and logging users in and out.
 * 
 *  */

class PositionoldController extends Controller {
    /*     * *

     * Returns a list of behaviors that this component should behave as.     /
     * @return array
     */

//export control excel
    public function behaviors() {
        return [
            //1
            'access' => [
                //1.1
                'class' => AccessControl::className(),
                //1.2
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'delete', 'grid', 'export', 'import'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            //2
            'verbs' => [
                //2.1
                'class' => VerbFilter::className(),
                //2.2
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
      Declares external action for the controllers.
     * 
     * @return array
     *      */
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex() {
        Yii::$app->db->createCommand()->prepare(true);

        $positions = Yii::$app->db->createCommand("SELECT * FROM position ORDER BY position_name ASC")->queryAll();

        $count = Yii::$app->db->createCommand("SELECT COUNT(*) FROM position")->queryScalar();

        return $this->render('index', [
                    'positions' => $positions,
                    'count' => $count,
        ]);
    }

    //controller for delete
    public function actionDelete($id) {
        Yii::$app->db->createCommand()->delete('position', ['position_id' => $id])->execute();
        return $this->redirect(['index']);
    }

    public function actionGrid() {
        $count = Yii::$app->db->createCommand('SELECT COUNT(*) FROM position')->queryScalar();
        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT * FROM position', //คำสั่ง SQL
            'totalCount' => $count, //จำนวนแถวทั้งหมด
            'pagination' => [
                'pageSize' => 10, //จะแหบ่งหน้าละกี่แถว
            ],
        ]);

        return $this->render('grid', [
                    'dataProvider' => $dataProvider,
        ]);
    }

    //export command excel
    public function actionExport() {
        $model = Position::find()->all(); //ในส่วนนี้เราสามารถคิวรี่ข้อมูลอย่างไรก็ได้ครับ ถ้าเราต้องการ

        return \moonland\phpexcel\Excel::widget([
                    'models' => $model,
                    'mode' => 'export', //default value as 'export'
                    'fileName' => time(),
        ]);
    }

    //import command excel
    public function actionImport() {
        $data = \moonland\phpexcel\Excel::widget([
                    'mode' => 'import',
                //    'fileName' => 'C:\xampp\htdocs\yii2system\uploads\data.xlsx', //path จริงที2อยู่ไฟล์ 
                'fileName' =>    'D:\01_Document\00_Projects\Hosts\Xampp\htdocs\yii2report\uploads\data.xlsx',
//'setFirstRecordAsKeys' => true, // if you want to set the keys of record column with first record, if it not set, the 
                    //       header with use the alphabet column on excel.
// 'setIndexSheetByName' => true, // set this if your excel data with multiple worksheet, the index of array will be set 
//        with the sheet name. If this not set, the index will use numeric.
                    'getOnlySheet' => 'Sheet1', // you can set this property if you want to get the specified sheet from the excel data with 
                        //    multiple worksheet.
        ]);
//echo print_r($data); 
//insert data array to table 
        foreach ($data as $key => $value) {
            Yii::$app->db->createCommand()->insert('position', [
                'position_id' => $value['position_id'],
                'position_name' => $value['position_name'],
            ])->execute();
        }
        return $this->redirect(['index']);
    }

}
