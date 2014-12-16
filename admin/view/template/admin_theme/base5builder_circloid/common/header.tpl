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
<!DOCTYPE html>
<html lang="<?php echo $lang; ?>">
<head>
	<meta charset="utf-8">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<!-- Le styles -->
	<?php if(!$is_custom_page){ ?>
		<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/bootstrap.css" rel="stylesheet" />
		<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/style.css" rel="stylesheet" />
		<?php if(isset($css_detail['css_name']) && ($css_detail['css_name'] != "default-profile")){?>
			<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/color_profiles/<?php echo $css_detail['css_name']; ?>.css" rel="stylesheet" />
		<?php } ?>
		<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/bootstrap-responsive.css" rel="stylesheet" />
		<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/style-responsive.css" rel="stylesheet" />
	<?php }else{ ?>
		<?php if(!$logged){ ?>
			<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/bootstrap.css" rel="stylesheet" />
		<?php } ?>
		<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/style-custom-page.css" rel="stylesheet" />
		<?php if(isset($css_detail['css_name']) && ($css_detail['css_name'] != "default-profile")){?>
			<link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/color_profiles/<?php echo $css_detail['css_name']; ?>.css" rel="stylesheet" />
		<?php } ?>
	<?php } ?>
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link type="text/css" href="view/javascript/admin_theme/base5builder_circloid/ui/themes/ui-lightness/jquery-ui-1.8.20.custom-min.css" rel="stylesheet" />
	<?php if(!$is_custom_page){ ?>
		<link type="text/css" href='view/stylesheet/admin_theme/base5builder_circloid/color_picker/spectrum.css' rel='stylesheet' />
	<?php } ?>
	  <!--[if IE 7]>
	  <link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/style-ie7.css" rel="stylesheet">
	  <![endif]-->
	  <!--[if IE 8]>
	  <link type="text/css" href="view/stylesheet/admin_theme/base5builder_circloid/style-ie8.css" rel="stylesheet">
	  <![endif]-->
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/jquery.1.7.2.js"></script>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/ui/jquery-ui-1.8.20.custom.min.js"></script>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/tabs.js"></script>
	  <?php foreach ($styles as $style) { ?>
	  <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	  <?php } ?>
	  <?php foreach ($scripts as $script) { ?>
	  <script type="text/javascript" src="<?php echo $script; ?>"></script>
	  <?php } ?>
	  <?php if($this->user->getUserName() && $is_homepage){ ?>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/flot/jquery.flot.min.js"></script>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/flot/jquery.flot.pie.min.js"></script>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/flot/jquery.flot.tooltip.min.js"></script>
	  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/modernizr.js"></script>
		<!--[if lte IE 8]>
		<script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/excanvas.min.js"></script>
		<![endif]-->
		<?php } ?>
		<script type="text/javascript">
		$(document).ready(function(){

		// Signin - Button

		$(".form-signin-buttons input").click(function(){
			$(".form-signin").submit();
		});

		// Signin - Enter Key

		$('.form-signin input').keydown(function(e) {
			if (e.keyCode == 13) {
				$('.form-signin').submit();
			}
		});

	    // Confirm Delete
	    $('#form').submit(function(){
	    	if ($(this).attr('action').indexOf('delete',1) != -1) {
	    		if (!confirm('<?php echo $text_confirm; ?>')) {
	    			return false;
	    		}
	    	}
	    });

		// Confirm Uninstall
		$('a').click(function(){
			if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
				if (!confirm('<?php echo $text_confirm; ?>')) {
					return false;
				}
			}
		});
	});
		</script>

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script type="text/javascript" src="view/javascript/admin_theme/base5builder_circloid/misc/html5shiv.js"></script>
  <![endif]-->
  
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="view/image/admin_theme/base5builder_circloid/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="view/image/admin_theme/base5builder_circloid/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="view/image/admin_theme/base5builder_circloid/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="view/image/admin_theme/base5builder_circloid/ico/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="view/image/admin_theme/base5builder_circloid/ico/favicon.png">
</head>

<!-- Set the active color profile -->
<body class="<?php if(isset($css_detail['css_name'])){echo $css_detail['css_name'];} ?>" data-color-profile="<?php if(isset($css_detail['css_name'])){echo $css_detail['css_name'];} ?>">
	<div class="container-fluid">

		<?php if ($logged) { ?>

		<div class="header">
			<div class="logo">
                <h2><?php echo $this->config->get('config_name'); ?></h2>
			</div>
			<!-- Menu Control For Mobile/Tablets -->
			<div id="menu-control">
				<div class="menu-control-outer">
					<div class="menu-control-inner">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</div>
				</div>
			</div>
			<!-- Displays Secondary Menu -->
			<div class="secondary-menu">
				<ul>
					<li id="store">
						<a class="top"><span><?php echo $text_front; ?></span></a>
						<ul>
							<li><a  href="<?php echo $store; ?>" target="_blank" class="top"><?php echo $this->config->get('config_name'); ?></a></li>
							<?php foreach ($stores as $stores) { ?>
							<li><a href="<?php echo $stores['href']; ?>" target="_blank"><?php echo $stores['name']; ?></a></li>
							<?php } ?>
						</ul>
					</li>
					<li id="logout"><a class="top" href="<?php echo $logout; ?>"><span><?php echo $text_logout; ?></span></a></li>
				</ul>
			</div>
			<!-- Displays Low Stock/Out of Stock Warnings -->
			
			<?php
			if(!isset($theme_not_installed)){
				if ($this->user->hasPermission('access', 'catalog/product')) {
					
					if($low_stock > 0 || $out_stock > 0){
						?>
						<div class="stock-alert-header">
							<?php if($low_stock > 0 ){ ?>
							<div class="low-stock-alert stock-alert">
								<a href="<?php echo $low_stock_link; ?>">
									<img src="view/image/admin_theme/base5builder_circloid/icon-lowstock.png" alt="Low Stock" width="32" height="32" />
								</a>
								<div class="alert-label">
									<a href="<?php echo $low_stock_link; ?>">
										<?php echo $text_low_stock; ?>
									</a>
								</div>
								<div class="stock-number-outer">
									<div class="stock-number-inner">
										<div class="stock-number">
											<?php echo $low_stock; ?>
										</div>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php if($out_stock > 0 ){ ?>
							<div class="out-stock-alert stock-alert">
								<a href="<?php echo $out_stock_link; ?>">
									<img src="view/image/admin_theme/base5builder_circloid/icon-lowstock.png" alt="Out Of Stock" width="32" height="32" />
								</a>
								<div class="alert-label">
									<a href="<?php echo $out_stock_link; ?>">
										<?php echo $text_out_stock; ?>
									</a>
								</div>
								<div class="stock-number-outer">
									<div class="stock-number-inner">
										<div class="stock-number">
											<?php echo $out_stock; ?>
										</div>
									</div>
								</div>
							</div>
							<?php } ?>
						</div>
						<?php
					}

				}
			}
			?>
			<!-- Displays Logged In User -->
			<div class="admin-info">
				<img src="view/image/admin_theme/base5builder_circloid/icon-user.png" alt="Admin" width="32" height="32" />
				<?php echo $logged; ?>
			</div>
			<?php if(!$is_custom_page){ ?>
			<div class="clearfix"></div>
			<?php }else{ ?>
			<div class="clear"></div>
			<?php } ?>
		</div>
		<!-- Main Container For Each Page Content -->
		<div class="main-body">
			<!-- Left Menu/Main Menu -->
			<div id="left-column">
				<div id="mainnav">
					<ul class="mainnav">
						<?php if(!$is_custom_page){ ?>
						<li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></li>
						<li id="catalog"><a class="top"><?php echo $text_catalog; ?></a>
							<ul>
								<li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
								<li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
								<li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
								<li><a class="parent"><?php echo $text_attribute; ?></a>
									<ul>
										<li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
										<li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
									</ul>
								</li>
								<li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
								<li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
								<li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
							</ul>
						</li>
						<li id="extension"><a class="top"><?php echo $text_extension; ?></a>
							<ul>
								<li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
								<li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
								<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
								<li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
								<li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
							</ul>
						</li>
						<li id="sale"><a class="top"><?php echo $text_sale; ?></a>
							<ul>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
								<li><a class="parent"><?php echo $text_customer; ?></a>
									<ul>
										<li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
										<li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
										<li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
									</ul>
								</li>
								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
								<li><a class="parent"><?php echo $text_voucher; ?></a>
									<ul>
										<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
										<li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
									</ul>
								</li>
								<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							</ul>
						</li>
						<li id="system"><a class="top"><?php echo $text_system; ?></a>
							<ul>
								<li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
								<li><a class="parent"><?php echo $text_design; ?></a>
									<ul>
										<li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
										<li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
									</ul>
								</li>
								<li><a class="parent"><?php echo $text_users; ?></a>
									<ul>
										<li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
										<li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
									</ul>
								</li>
								<li><a class="parent"><?php echo $text_localisation; ?></a>
									<ul>
										<li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
										<li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
										<li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
										<li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
										<li><a class="parent"><?php echo $text_return; ?></a>
											<ul>
												<li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
												<li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
												<li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
											</ul>
										</li>
										<li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
										<li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
										<li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
										<li><a class="parent"><?php echo $text_tax; ?></a>
											<ul>
												<li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
												<li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
											</ul>
										</li>
										<li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
										<li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
									</ul>
								</li>
								<li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
								<li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
							</ul>
						</li>
						<li id="reports"><a class="top"><?php echo $text_reports; ?></a>
							<ul>
								<li><a class="parent"><?php echo $text_sale; ?></a>
									<ul>
										<li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
										<li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
										<li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
										<li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
										<li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
									</ul>
								</li>
								<li><a class="parent"><?php echo $text_product; ?></a>
									<ul>
										<li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
										<li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
									</ul>
								</li>
								<li><a class="parent"><?php echo $text_customer; ?></a>
									<ul>
										<li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
										<li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
										<li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
										<li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
									</ul>
								</li>
								<li><a class="parent"><?php echo $text_affiliate; ?></a>
									<ul>
										<li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li id="help"><a class="top"><?php echo $text_help; ?></a>
							<ul>
								<li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
								<li><a href="http://www.opencart.com/index.php?route=documentation/introduction" target="_blank"><?php echo $text_documentation; ?></a></li>
								<li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
								<?php if(!$is_custom_page){ ?>
									<li id="add-custom-admin-page"><a href="#">Make This Page Compatible</a></li>
								<?php }else{ ?>
									<li id="remove-custom-admin-page"><a href="#">Remove Page Compatibility</a></li>
								<?php } ?>
							</ul>
						</li>
						<?php }else{ ?>
						<li id="extension"><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
						<li id="help">
							<a class="top">
								<?php echo  $text_help; ?>
							</a>
							<ul>
								<?php if(!$is_custom_page){ ?>
									<li id="add-custom-admin-page"><a href="#">Make This Page Compatible</a></li>
								<?php }else{ ?>
									<li id="remove-custom-admin-page"><a href="#">Remove Page Compatibility</a></li>
								<?php } ?>
							</ul>
						</li>
						<?php } ?>
					</ul>
				</div>
			</div>
			<div id="right-column">
				<?php } ?>
