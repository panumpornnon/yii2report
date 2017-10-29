<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "prefix".
 *
 * @property string $prefix_id
 * @property string $prefix_name
 *
 * @property Person[] $people
 */
class Prefix extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'prefix';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['prefix_id'], 'required'],
            [['prefix_id'], 'string', 'max' => 2],
            [['prefix_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'prefix_id' => 'รหัสคำนำหน้านาม',
            'prefix_name' => 'คำนำหน้านาม',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeople()
    {
        return $this->hasMany(Person::className(), ['prefix_id' => 'prefix_id']);
    }
}
