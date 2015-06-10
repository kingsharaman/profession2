<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
?>
<h1>Job listings</h1>
<ul>
<?php foreach ($listings as $listing): ?>
    <li>
		<?= $listing->id ?>:
        <?= Html::encode("{$listing->title} ({$listing->status})") ?>
		<a href="<?= Yii::$app->getHomeUrl() ?>?id=<?= $listing->id ?>">Review</a>
        
    </li>
<?php endforeach; ?>
</ul>

<?= LinkPager::widget(['pagination' => $pagination]) ?>