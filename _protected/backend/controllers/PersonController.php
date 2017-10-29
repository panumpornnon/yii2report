<?php

namespace backend\controllers;

use Yii;
use backend\models\Person;
use backend\models\PersonSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;

/**
 * PersonController implements the CRUD actions for Person model.
 */
class PersonController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Person models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PersonSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Person model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Person model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Person();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->person_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Person model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->person_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Person model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Person model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Person the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Person::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    //GenPdf
    public function actionPdf(){
        $query = Person::find()->limit(50); //ตรงนี้สามารถควิรี่ข้อมูลตามใจชอบ
        
        $dataProvider = new \yii\data\ActiveDataProvider([
            'query' => $query,
            'pagination' => false, //เพื่อการแสดงผลทั้งหมด เลยปิดไม่ให้แบ่งหน้า
        ]);
        
        $content = $this->renderPartial('report',[
            'dataProvider' => $dataProvider,
        ]);
        
        //setup kartik\mpdf\Pdf component
        $pdf = new Pdf([
            //set to use core fonts only
            'mode' => Pdf::MODE_UTF8,
            //A4 paper format
            'format' => Pdf::FORMAT_A4,
            //'format' => [100,200], //กว้าง,สูง สำหรับ custom ขนาดกระดาษเอง
            //filename
            'filename' => time(),
            //portrait orientation
            'orientation' => Pdf::ORIENT_PORTRAIT,
            //stream to browser inline
            'destination' => Pdf::DEST_BROWSER,
            //you html content input
            'content' => $content,
            //format content from your own css file if needed or use the
            //enchanced bootstrap css built by Krajee for mPDF formatting
            'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.css',
            //any css to be embedded if required
            'cssInline' => '.kv-heading-1{font-size:18px}',
            //set mPDF properties on the fly
            'options' =>[
                'title' => 'codingthailand',
                'subject' => 'person report',
                'keywords' => 'person,codingthailand',
            ],
            //call mPDF methods on the fly
            'methods' => [
                'SetHeader' => ['รายงานโดย codingthailand || ออกรายงานเมื่อ :'.Yii::$app->formatter->asDatetime(time())],
                'SetFooter' => ['หน้าที่ {PAGENO}'],
            ]
            
        ]);
        //return the pdf output as per the destination setting
        return $pdf->render();
    }
}
