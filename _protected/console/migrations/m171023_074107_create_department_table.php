<?php

use yii\db\Migration;

/**
 * Handles the creation of table `department`.
 */
class m171023_074107_create_department_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
		$tableOptions = null;
		if($this->db->driverName === 'mysql'){
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
		}
		
        $this->createTable('department', [
            'deptID' => $this->string(2),
			'deptName' => $this->string()->notNull(),
			'PRIMARY KEY(deptID)',
        ], $tableOptions);
		
		$this->batchInsert('department',['deptID','deptName'],[
			['01','การเงิน'],
			['02','บัญชี'],
			['03','ไอที']
		]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('department');
		return true;
		//echo "m171023_074107_create_department_table cannot be reverted.\n";
		//return false;
    }
}
