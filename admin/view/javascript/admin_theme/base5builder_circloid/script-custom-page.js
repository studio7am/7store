$(document).ready(function(){

	/*

	General JS

	*/

	/* Change Header Icon Based on Color Profile - Start */

	var getColorProfile = $("body").data("color-profile");
	if(getColorProfile){
		var colorProfile = getColorProfile.split("-");
		var getHeaderImage = $("h1 img").attr("src");
		if(getHeaderImage){
			var splitHeaderImage = getHeaderImage.split("/");

			if(colorProfile[0] != "default"){
				$("h1 img").attr("src", splitHeaderImage[0] + "/" + splitHeaderImage[1] + "/" + splitHeaderImage[2] + "/" + splitHeaderImage[3] + "/" + "color_profiles/" + colorProfile[0] + "_" + colorProfile[1] + "/" + splitHeaderImage[4]);
			}
		}
	}

	/* Change Header Icon Based on Color Profile - End */

	/* Secondary Menu - Toggle Effects - Start */

	$(".secondary-menu > ul > li#store > a").click(function(e){
		// Check if menu is open or close
		var menuOpen = $(".secondary-menu > ul ul").is(':visible');
		if(!menuOpen){
			// Open the dropdown menu and add the "menu-open" class
			$(this).parent().addClass("menu-open");
			$(this).next("ul").removeAttr("style").animate({"top": "38px", "opacity":"show"},200);
		}else{
			// Close the dropdown menu and remove the "menu-open" class
			$(this).next("ul").animate({"top": "50px", "opacity":"hide"},200);
			$(this).parent().removeClass("menu-open");
		}
		e.stopPropagation();
	});

	/* Secondary Menu - Toggle Effects - End */


	/* Stock Alert (Header) - Tooltip - Start */

	$(".stock-alert-header .stock-alert a").hover(function(e){
		// Shows the title on hover
		$(this).next("div.alert-label").removeAttr("style").animate({"bottom": "-32px", "opacity":"show"},200);
		e.stopPropagation();
	},function(e){
		// Hides the title on blur
		$(this).next("div.alert-label").animate({"bottom": "-100px", "opacity":"hide"},200);
		e.stopPropagation();
	});

	/* Stock Alert (Header) - Tooltip - End */


	/* Main Nav - Highlight Active Menu Item - Start */

	// This function is copied straight from the default OpenCart theme
	function getURLVar(urlVarName) {
		var urlHalves = String(document.location).toLowerCase().split('?');
		var urlVarValue = '';

		if (urlHalves[1]) {
			var urlVars = urlHalves[1].split('&');

			for (var i = 0; i <= (urlVars.length); i++) {
				if (urlVars[i]) {
					var urlVarPair = urlVars[i].split('=');

					if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
						urlVarValue = urlVarPair[1];
					}
				}
			}
		}
		return urlVarValue;
	} 

	route = getURLVar('route');
	
	// Get Current URL Route
	if (!route) {
		$('#dashboard').addClass('selected');
	} else {
		part = route.split('/');
		
		url = part[0];
		
		if (part[1]) {
			url += '/' + part[1];
		}
		
		$('a[href*=\'' + url + '\']').parents('li[id]').addClass('selected');

		// Add Class To Right Column Based On Active Menu
		$("#right-column").addClass(part[0]);
	}

	// Mobile Device Menu Control
	
	$("#menu-control").click(function(e){
		var leftMenuOpen = $("#left-column").is(":visible");

		if(leftMenuOpen){
			// Else, if opened, close it
			$("#left-column").animate({"left": "-110px", "opacity":"hide"},300, function(){
				$("#left-column").removeAttr("style");
				$(".menu-control-outer").removeClass("opened");
			});
		}else{
			// If menu closed, then slide open
			$("#left-column").animate({"left": "0", "opacity":"show"},300);
			$(".menu-control-outer").addClass("opened");
		}
		e.stopPropagation();
	});

	/* Main Nav - Highlight Active Menu Item - End */


	/* Main/Left Menu - Toggle Effects - Start */

	// First Level Menu
	// Clicked Menu Item
	$("ul.mainnav > li > a.top").click(function(e){
		var getOpenMenuOthers = $(this).parent().siblings().hasClass("menu-open"); // Get the class of other menu items
		var getOpenMenuThis = $(this).parent().hasClass("menu-open"); // Get the class of clicked menu item

		// If other menu items have the "menu-open" class. This means this menu is open. So...
		if(getOpenMenuOthers){
			// Close the menu
			$("ul.mainnav > li > ul").animate({"top": "50px", "opacity":"hide"},200, function(){
				// Remove the "menu-open" class
				$(this).parent().removeClass("menu-open");
				// Remove the styling that is adding by the animate. This resets the dropdown's position.
				$(this).removeAttr("style");
				$("ul.mainnav > li > ul ul").removeAttr("style");
			});
		}

		// If the clicked menu item has the "menu-open" class. This means this menu is open. So...
		if(getOpenMenuThis){
			// Close the menu
			$("ul.mainnav > li > ul").animate({"top": "50px", "opacity":"hide"},200, function(){
				// Remove the "menu-open" class
				$(this).parent().removeClass("menu-open");
				// Remove the styling that is adding by the animate. This resets the dropdown's position.
				$(this).removeAttr("style");
				$("ul.mainnav > li > ul ul").removeAttr("style");
			});
		}else{
			// If this menu item doesn't have the "menu-open" class, then open the menu
			$(this).next("ul").animate({"top": "0px", "opacity":"show"},200, function(){
				// Add "menu-open" class
				$(this).parent().addClass("menu-open");
			});
		}

		e.stopPropagation();
	});

	// Second, Third, etc... Level
	// Using Accordion Script
	// Clicked Menu Item
	$("ul.mainnav > li > ul").accordion({
		accordion:true,
		speed: 200,
		closedSign: '', // Leave blank because I use arrows set in CSS file
		openedSign: '' // Leave blank because I use arrows set in CSS file
	});

	// Bug Fix - Prevents Menu from closing when dropdown is clicked
	$("ul.mainnav > li > ul").click(function(e){
		e.stopPropagation();
	});

	/* Main/Left Menu - Toggle Effects - End */


	/* Close Open Menus If User CLicks Outside the Menu (Works on both Left and Secondary Menus) - Start */

	$('html').click(function() {
		// Hide the menus if visible
		$("ul.mainnav > li.menu-open > ul, .secondary-menu > ul ul").animate({"top": "50px", "opacity":"hide"},200, function(){
			$(this).removeAttr("style");
			$(this).parent().removeClass("menu-open");

			// Mobile Menu Close
			// var leftMenuOpen = $("#left-column").css("left");
			var leftMenuOpen = $(".menu-control-outer").hasClass("opened");

			if(leftMenuOpen){
				$("#left-column").animate({"left": "-110px", "opacity":"hide"},300, function(){
					$("#left-column").removeAttr("style");
					$(".menu-control-outer").removeClass("opened");
				});
			}
		});
	});

	/* Close Open Menus If User CLicks Outsite the Menu - End */


	/* Close Success/Warning Messages - Start */

	$(".success, .warning").live("click", function(){
		$(".success, .warning").remove();
	});

	/* Close Success/Warning Messages - End */


	/* Horizontal Scrolling For Tables For Small Screens - Start */
	var boxWidth = $(".box").width();
	var tableListWidth = $("table.list").width();
	var formTableWidth = $("form#form").height();

	if(tableListWidth > boxWidth){
		if(formTableWidth > 0){
			$("form#form").css("overflow", "auto");
		}else{
			$("table.list").parent().css("overflow", "auto");
		}
	}else{
		if(formTableWidth > 0){
			$("form#form").css("overflow", "auto");
		}else{
			$("table.list").parent().css("overflow", "auto");
		}
	}

	// Function To Prevent Multiple Calls While Browser Is Resizing Or Orientation Is Changed (Prevents a glitching effect)

	var waitForFinalEvent = (function () {
		var timers = {};
		return function (callback, ms, uniqueId) {
			if (!uniqueId) {
				uniqueId = "Don't call this twice without a uniqueId";
			}
			if (timers[uniqueId]) {
				clearTimeout (timers[uniqueId]);
			}
			timers[uniqueId] = setTimeout(callback, ms);
		};
	})();

	function generateUniqueString(){
		var text = "";
		var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		for( var i=0; i < 5; i++ )
			text += possible.charAt(Math.floor(Math.random() * possible.length));

		return text;
	}
	
	// Actual Window Resize Code
	var currentWindowWidth = $(window).width();

	$(window).resize(function () {
		waitForFinalEvent(function(){

			if($(this).width() != currentWindowWidth){

				currentWindowWidth = $(window).width();

				var boxWidth = $(".box").width();
				var tableListWidth = $("table.list").width();
				var formTableWidth = $("form#form").height();

				if(tableListWidth > boxWidth){
					if(formTableWidth > 0){
						$("form#form").css("overflow", "auto");
					}else{
						$("table.list").parent().css("overflow", "auto");
					}
				}else{
					if(formTableWidth > 0){
						$("form#form").css("overflow", "auto");
					}else{
						$("table.list").parent().css("overflow", "auto");
					}
				}

				// Close Menu On Mobile Device
				$("#left-column").removeAttr("style");
				$(".menu-control-outer").removeClass("opened");
			}

		}, 500, generateUniqueString());
	});
	/* Horizontal Scrolling For Tables For Small Screens - End */
	

	/* Tabs - Start */

	$('#tabs a').tabs();

	/* Tabs - End */



	/* Add/Remove Custom Admin Page - Start */

	// Add Custom Admin Page
	$("#add-custom-admin-page a").click(function(e){
		route = encodeURI(getURLVar('route'));

		$.ajax({
			type: 'GET',
			url: 'index.php?route=common/admin_circloid_dashboard_editor/saveCustomAdminPage&token=' + QueryString.token + '&adminpage=' + route,
			dataType: 'json',
			beforeSend: function(){
				$(".dashboard-editor-color-profile .loading").show();
			},
			error: function(){
				var textAjaxError = $(".ajax-error").text();
				$('<div class="warning hidden">' + textAjaxError + '</div>').appendTo(".dashboard-editor-content").css("visibility", "visible").fadeIn(300);
				$(".dashboard-editor-color-profile .loading").hide();
			},
			success: function(json) {

				$('.success').remove();
				$('.warning').remove();

				$(".dashboard-editor-color-profile .loading").hide();

				if(json.saved_custom_admin_page){
					// console.log("saved");
					location.reload();
				}else{
					// console.log("not");
					location.reload();
				}
			}
		});

		e.preventDefault();
	});
	
	// Remove Custom Admin Page
	$("#remove-custom-admin-page a").click(function(e){
		route = encodeURI(getURLVar('route'));

		$.ajax({
			type: 'GET',
			url: 'index.php?route=common/admin_circloid_dashboard_editor/removeCustomAdminPage&token=' + QueryString.token + '&adminpage=' + route,
			dataType: 'json',
			beforeSend: function(){
				$(".dashboard-editor-color-profile .loading").show();
			},
			error: function(){
				var textAjaxError = $(".ajax-error").text();
				$('<div class="warning hidden">' + textAjaxError + '</div>').appendTo(".dashboard-editor-content").css("visibility", "visible").fadeIn(300);
				$(".dashboard-editor-color-profile .loading").hide();
			},
			success: function(json) {

				$('.success').remove();
				$('.warning').remove();

				$(".dashboard-editor-color-profile .loading").hide();

				if(json.removed_custom_admin_page){
					location.reload();
				}else{
					location.reload();
				}
			}
		});

		e.preventDefault();
	});

	/* Add/Remove Custom Admin Page - End */


	/* Get URL Parameter - Start */

	var QueryString = function () {
		// This function is anonymous, is executed immediately and 
		// the return value is assigned to QueryString!
		var query_string = {};
		var query = window.location.search.substring(1);
		var vars = query.split("&");
		for (var i=0;i<vars.length;i++) {
			var pair = vars[i].split("=");
			// If first entry with this name
			if (typeof query_string[pair[0]] === "undefined") {
				query_string[pair[0]] = pair[1];
				// If second entry with this name
			} else if (typeof query_string[pair[0]] === "string") {
				var arr = [ query_string[pair[0]], pair[1] ];
				query_string[pair[0]] = arr;
				// If third or later entry with this name
			} else {
				query_string[pair[0]].push(pair[1]);
			}
		} 
		return query_string;
	} ();

	/* Get URL Parameter - End */

});