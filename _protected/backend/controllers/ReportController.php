<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;

/**
 * PrefixController implements the CRUD actions for Prefix model.
 */
class ReportController extends Controller {

    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
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
        
return $this->render('index');
    /*    return $this->render('index', [
                    'positions' => $positions,
                    'count' => $count,
        ]);*/
    }
    /**
     * Lists all Prefix models.
     * @return mixed
     */
    public function actionReport1() {
        /*
          SELECT
          department.department_name
          FROM
          person
          INNER JOIN department ON person.department_id = department.department_id
          GROUP BY
          department.department_name
         */
        $query = new Query();
        $department = $query->select('department_name')
                ->from('person')
                ->innerJoin('department', 'person.department_id = department.department_id')
                ->groupBy('department.department_name')
                ->all();
//Count(person.person_id) AS countperson
        $query2 = new Query();
        $count = $query2->select('Count(person.person_id) AS countperson')
                ->from('person')
                ->innerJoin('department', 'person.department_id = department.department_id')
                ->groupBy('department.department_name')
                ->all();
        return $this->render('report1', [
                    'department' => $department,
                    'count' => $count,
        ]);
    }

    public function actionReport2() {
        /*
          SELECT
          department.department_name
          FROM person
          INNER JOIN department ON person.department_id = department.department_id
          GROUP BY
          department.department_name
         */
        $query = new Query();
        $department = $query->select('department_name')
                ->from('person')
                ->innerJoin('department', 'person.department_id = department.department_id')
                ->groupBy('department.department_name')
                ->all();
//Count(person.person_id) AS countperson
        $query2 = new Query();
        $count = $query2->select('Count(person.person_id) AS countperson')
                ->from('person')
                ->innerJoin('department', 'person.department_id = department.department_id')
                ->groupBy('department.department_name')
                ->all();
        return $this->render('report2', [
                    'department' => $department,
                    'count' => $count,
        ]);
    }

    public function actionReport3() {
        /*
          SELECT
          position.position_name,
          Count(person.person_id) FROM
          person
          INNER JOIN position ON person.position_id = position.position_id
          GROUP BY
          position.position_name
         */
        $query2 = new Query();
        $data = $query2->select(['position_name', 'count' => 'Count(person.person_id)'])
                ->from('person')
                ->innerJoin('position', 'person.position_id = position.position_id')
                ->groupBy('position.position_name')
                ->all();
        return $this->render('report3', [
                    'data' => $data,
        ]);
    }

}
