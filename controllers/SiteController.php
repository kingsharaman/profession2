<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use app\models\Listing;
use app\models\ListingForm;

class SiteController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
		$id = Yii::$app->request->get('id');
		
		if(!$id) {
			$query = Listing::find();

			$pagination = new Pagination([
				'defaultPageSize' => 5,
				'totalCount' => $query->count(),
			]);

			$listings = $query->orderBy('id')
				->offset($pagination->offset)
				->limit($pagination->limit)
				->all();
				
			return $this->render('index', [
				'listings' => $listings,
				'pagination' => $pagination
			]);	
		}
		else {
			$model = new ListingForm();
			
			$listing[$model->formName()] = Yii::$app->db->createCommand('SELECT * FROM job_listings WHERE id=:id')->bindValue(':id', $id)->queryOne();
			
			$model->load($listing);
			
			return $this->render('review', ['model' => $model, 'layout' => 'main']);
		}		
    }
	
	public function actionActivate()
	{
        $model = new ListingForm();
		
		$id = Yii::$app->request->post($model->formName())["id"];
		
		Yii::$app->db->createCommand('UPDATE job_listings SET status=\'aktív\' WHERE id=:id')->bindValue(':id', $id)->execute();
		Yii::$app->db->createCommand('UPDATE job_listings SET activated=NOW() WHERE id=:id')->bindValue(':id', $id)->execute();
		
		$listing[$model->formName()] = Yii::$app->db->createCommand('SELECT * FROM job_listings WHERE id=:id')->bindValue(':id', $id)->queryOne();
		
		$model->load($listing);
		
		mail($model->email, 'Hirdetés aktiválása', $model->id." azonosítójú hirdetését ".$model->activated."-kor sikeresen aktiváltuk.");		
		
        return $this->render('activate', ['model' => $model, 'layout' => 'main']);
	}
}
