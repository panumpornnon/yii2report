<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "person".
 *
 * @property string $person_id
 * @property string $prefix_id
 * @property string $person_firstname
 * @property string $person_lastname
 * @property string $person_date_work_start
 * @property string $position_id
 * @property string $department_id
 * @property string $person_address
 * @property string $person_tel
 * @property string $person_picture
 * @property string $person_work_status
 *
 * @property Prefix $prefix
 * @property Position $position
 * @property Department $department
 */
class Person extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'person';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['person_id'], 'required'],
            [['person_date_work_start'], 'safe'],
            [['person_id'], 'string', 'max' => 5],
            [['prefix_id', 'department_id'], 'string', 'max' => 2],
            [['person_firstname', 'person_lastname'], 'string', 'max' => 100],
            [['position_id'], 'string', 'max' => 3],
            [['person_address', 'person_picture'], 'string', 'max' => 255],
            [['person_tel'], 'string', 'max' => 150],
            [['person_work_status'], 'string', 'max' => 1],
            [['prefix_id'], 'exist', 'skipOnError' => true, 'targetClass' => Prefix::className(), 'targetAttribute' => ['prefix_id' => 'prefix_id']],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['position_id' => 'position_id']],
            [['department_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['department_id' => 'department_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'person_id' => 'Person ID',
            'prefix_id' => 'Prefix ID',
            'person_firstname' => 'Person Firstname',
            'person_lastname' => 'Person Lastname',
            'person_date_work_start' => 'Person Date Work Start',
            'position_id' => 'Position ID',
            'department_id' => 'Department ID',
            'person_address' => 'Person Address',
            'person_tel' => 'Person Tel',
            'person_picture' => 'Person Picture',
            'person_work_status' => 'Person Work Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPrefix()
    {
        return $this->hasOne(Prefix::className(), ['prefix_id' => 'prefix_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(Position::className(), ['position_id' => 'position_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['department_id' => 'department_id']);
    }
    
    //
    //Map PrefixName for DropDownList
    public static function getPrefixName() {
        $prefixName = Prefix::find()->asArray()->all();
        return \yii\helpers\ArrayHelper::map($prefixName, 'prefix_name', 'prefix_name');
    }
    
}
