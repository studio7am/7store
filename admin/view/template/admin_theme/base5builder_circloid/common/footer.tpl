	<div class="footer-text"><?php echo $text_footer; ?></div>
	<?php

		if ($logged) { // Only displays when a user is logged in
	?>
			</div> <!-- End of right-column -->
		</div> <!-- End of main-body -->
	<?php } ?>
</div> <!-- End of fluid-container -->

<?php


if(isset($this->request->get['route'])){
	$current_location = explode("/", $this->request->get['route']);
	if($current_location[0] == "common"){
		$is_homepage = TRUE;
	}else{
		$is_homepage = FALSE;
	}
}else{
	$is_homepage = FALSE;
}

if(isset($this->request->get['route'])){
	if($this->request->get['route'] == "common/login"){
		$is_custom_page = FALSE;
	}
}
if(!isset($this->request->get['route'])){
	$is_custom_page = FALSE;
}

?>
	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/bootstrap/bootstrap-min.js"></script>
	<?php if($this->user->getUserName()){ ?>
		<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/scriptbreaker-multiple-accordion-1.0-min.js"></script>

		<?php if($is_homepage){ ?>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/color_picker/spectrum-min.js"></script>
		<?php } ?>
		<?php
		if(!$is_custom_page){
			?>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script.js"></script>
			<?php
		}else{ 
			if($logged){
				?>
				<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script-custom-page.js"></script>
				<?php
			}else{
				?>
				<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script.js"></script>
				<?php
			}
		}
		?>

		<?php if($is_homepage){ ?>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/serialize.js"></script>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script-dashboard-widgets.js"></script>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script-dashboard-editor.js"></script>
			<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/color_picker/spectrum.js"></script>
		<?php } ?>
	<?php }
		if(!$logged){
		?>
		<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/script-logged-out.js"></script>
		<?php
	} ?>
	<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/retina-1.1.0.min.js"></script>
</body>
</html>
