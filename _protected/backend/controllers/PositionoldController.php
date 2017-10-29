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
                        'actions' => ['logout', 'index','delete','grid'],
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
    public function actionDelete($id){
        Yii::$app->db->createCommand()->delete('position',['position_id'=>$id])->execute();
        return $this->redirect(['index']);
    }

    
    public function actionGrid(){
        $count = Yii::$app->db->createCommand('SELECT COUNT(*) FROM position')->queryScalar();
        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT * FROM position', //คำสั่ง SQL
            'totalCount'=> $count, //จำนวนแถวทั้งหมด
            'pagination'=>[
                'pageSize' => 10, //จะแหบ่งหน้าละกี่แถว
            ],
        ]);
        
        return $this->render('grid',[
            'dataProvider' => $dataProvider,
        ]); 
    }
}
