<?php echo $header; ?>
<h1>Шаг 1 - Старт</h1>
<div id="column-right" class="well">
  <ul>
      <li><b>Старт	</b></li>
      <li>Перед установкой</li>
      <li>Конфигурация</li>
      <li>Окончание</li>
    </ul>
</div>
<div id="content">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="terms">
      <h3>7store</h3>
        <p>Форк osStore для внутренних проектов студии</p>
		<p>Версия 1.0, от 16 декабря 2014</p>
		<hr>
   </div>
    <div class="buttons">
        <input type="submit" value="Поехали" class="btn btn-danger btn-block">
      </div>
    </div>
  </form>
</div>
<?php echo $footer; ?>