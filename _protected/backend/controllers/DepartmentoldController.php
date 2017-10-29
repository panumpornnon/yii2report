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
use yii\db\Query;

class DepartmentoldController extends Controller {

    public function behaviors() {
        return[
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ], //rules
            ], //access
        ];
    }

    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ]
        ];
    }

    public function actionIndex() {
        $query = new Query();

        $count = $query->from('department')->count();
        /* $department = $query->select()
          ->from('department')
          ->all(); */
        
        //$id = '02';
        $department = $query->select(['department_id', 'department_name'])
                ->from('department')
             //   ->where(['department_id' => $id])
                ->all();
        return $this->render('index', [
                    'departments' => $department,
                    'count' => $count,
        ]);
    }

}
