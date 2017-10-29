<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Person;

/**
 * PersonSearch represents the model behind the search form about `backend\models\Person`.
 */
class PersonSearch extends Person {

    //For 0.Join Data
    public $prefix;
    public $position;
    public $department;
    
    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['person_id', 'prefix_id', 'person_firstname', 'person_lastname', 'person_date_work_start', 'position_id',
            'department_id', 'person_address', 'person_tel', 'person_picture', 'person_work_status',
              //For 0.Join Data  
                'prefix','position','department'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios() {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params) {
        //$query = Person::find();
        //For 1.Join Data
        $query = Person::find()->joinWith(['prefix', 'position', 'department']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        //For 2.Join Data
        /* $dataProvider->sort->attributes['prefix'] = [
          'asc' => ['prefix.prefix_name'=>SORT_ASC],
          'desc'=> ['prefix.prefix_name'=>SORT_DESC],
          ]; 
         */

        $dataProvider->sort->attributes['position'] = [
            'asc' => ['position.position_name' => SORT_ASC],
            'desc' => ['position.position_name' => SORT_DESC],
        ];
        $dataProvider->sort->attributes['department'] = [
            'asc' => ['department.department_name' => SORT_ASC],
            'desc' => ['department.department_name' => SORT_DESC],
        ];

        //End For 2.Join Data

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'person_date_work_start' => $this->person_date_work_start,
        ]);

        $query->andFilterWhere(['like', 'person_id', $this->person_id])
                ->andFilterWhere(['like', 'prefix_id', $this->prefix_id])
                ->andFilterWhere(['like', 'person_firstname', $this->person_firstname])
                ->andFilterWhere(['like', 'person_lastname', $this->person_lastname])
                ->andFilterWhere(['like', 'position_id', $this->position_id])
                ->andFilterWhere(['like', 'department_id', $this->department_id])
                ->andFilterWhere(['like', 'person_address', $this->person_address])
                ->andFilterWhere(['like', 'person_tel', $this->person_tel])
                ->andFilterWhere(['like', 'person_picture', $this->person_picture])
                ->andFilterWhere(['like', 'person_work_status', $this->person_work_status])
                ////For 3.Join Data
                ->andFilterWhere(['like', 'prefix.prefix_name', $this->prefix])
                ->andFilterWhere(['like', 'position.position_name', $this->position])
                ->andFilterWhere(['like', 'department.department_name', $this->department]);

        return $dataProvider;
    }

}
