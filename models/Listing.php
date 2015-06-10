<?php

namespace app\models;

use yii\db\ActiveRecord;

class Listing extends ActiveRecord
{
	public static function tableName() {
		return "job_listings";
	}
}