// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){	



 /* for keeping track of what's "open" */
  var activeClass = 'dropdown-active', showingDropdown, showingMenu, showingParent;
  /* hides the current menu */
  var hideMenu = function() {
    if(showingDropdown) {
      showingDropdown.removeClass(activeClass);
      showingMenu.hide();
    }
  };

  /* recurse through dropdown menus */
  $('.dropdown').each(function() {
    /* track elements: menu, parent */
    var dropdown = $(this);
    var menu = dropdown.next('div.dropdown-menu'), parent = dropdown.parent();
    /* function that shows THIS menu */
    var showMenu = function() {
      hideMenu();
      showingDropdown = dropdown.addClass('dropdown-active');
      showingMenu = menu.show();
      showingParent = parent;
    };
    /* function to show menu when clicked */
    dropdown.bind('click',function(e) {
      if(e) e.stopPropagation();
      if(e) e.preventDefault();
      showMenu();
    });
    /* function to show menu when someone tabs to the box */
    dropdown.bind('focus',function() {
      showMenu();
    });
  });

  /* hide when clicked outside */
  $(document.body).bind('click',function(e) {
    if(showingParent) {
      var parentElement = showingParent[0];
      if(!$.contains(parentElement,e.target) || !parentElement == e.target) {
        hideMenu();
      }
    }
  });










		// follow/unfollow hover
		$('#submit').hover(
		            function(){ // Change the input image's source when we "roll on"
		                $(this).attr({ src : 'enter_over.gif'});
		            },
		            function(){ // Change the input image's source back to the default on "roll off"
		                $(this).attr({ src : 'enter.gif'});             }
		 );


		$('.pagination a').attr('data-remote', 'true');

		// make invisible the search button in header
			$("#search_submit").hide();
		////////////////////////
		  $(".user_geolocation").hide();


		// Hide the post form button
		$("#post_button").hide();
		$("#post_counter").hide();
		$("#post_geolocation").hide();


		// image re-sizing
	      $( ".resizeme" ).aeImageResize({ height: 24, width: 24 });

		// header re-sizin
		$( ".headerpic" ).aeImageResize({ height: 18, width: 18 });
		// Suggestions re-sizing
		 $( ".resize_suggestion" ).aeImageResize({ height: 32, width: 32 });

		// Homepage re-sizing
		$( ".resize_homepage" ).aeImageResize({ height: 32, width: 32 });



		// Reply functionality
		$('.reply').click(function() {
		  $("textarea#post_textarea").val("Reply: ");
		 return false;
		});

		// Geolocation 
		$('.geolocation_link').click(function() {
		  $(".user_geolocation").show();
		  $(".geolocation_link").hide();
		 return false;
		});

		// Hover over tweets to see "retweet" option
		$(".feed_links_container").hide();
		$(".feed_container").hover(
		  function() { $(this).children(".feed_links_container").show(); },
		  function() { $(this).children(".feed_links_container").hide(); }
		);



			// for 140 count
					var options2 = {
									'maxCharacterSize': 140,
									'originalStyle': 'originalTextareaInfo',
									'warningStyle': 'warningTextareaInfo',
									'warningNumber': 40,
									'displayFormat': '#left'
								};



		// For the "Search" in the Searchbox
		$('.default-value').each(function() {
		    var default_value = this.value;
		    $(this).css('color', '#333'); // this could be in the style sheet instead
		    $(this).focus(function() {
		        if(this.value == default_value) {
		            this.value = '';
		            $(this).css('color', '#000');
		        }
		    });
		    $(this).blur(function() {
		        if(this.value == '') {
		            $(this).css('color', '#333');
		            this.value = default_value;
		        }
		    });
		});

		// black tips when hovering over user images
		$(function(){
		$(".phototip").tipTip();
		});

		var leftSideHeight = $("#left_side").height();
		var rightSideHeight = $("#right_side").height();

		// Set page height to height of left side
		$("section").height(leftSideHeight)

		if(leftSideHeight < 800) {
				leftSideHeight = 800;
				$("#left_side").height(leftSideHeight);
				$("section").height(leftSideHeight);
		}

	  	if(leftSideHeight > rightSideHeight) {

			$("#right_side").height(leftSideHeight);
		}




		// Animate the post entry field upon focus
		$("#post_textarea").focus(function()
		{
			$("#post_textarea").height(60);
			$("#post_geolocation").show();
			$("#post_button").show();
			$("#post_counter").show();

			return false;
		});

	   $('#post_textarea').textareaCount(options2);



		//	Who to Follow
		$("#all_users_pool").bind("ajax:complete", function(et, e){
		    $("#user_pool").html(e.responseText); // insert content
		 });

		$("#following_users_pool").bind("ajax:complete", function(et, e){
		   $("#user_pool").html(e.responseText); // insert content
		 });

		$("#followers_users_pool").bind("ajax:complete", function(et, e){
		    $("#user_pool").html(e.responseText); // insert content
		  });

		//$("#strangers_users_pool").bind("ajax:complete", function(et, e){
		 //   $("#user_pool").html(e.responseText); // insert content
		//});


		$("#featured_users_pool").bind("ajax:complete", function(et, e){
		    $("#user_pool").html(e.responseText); // insert content
		  });








		// Feed Filter
		$("#timeline_feed_pool").bind("ajax:complete", function(et, e){
		    $("#feed_pool").html(e.responseText); // insert content
			$("#timeline_feed_pool").addClass("filter_highlight");
				$("#mentions_feed_pool").removeClass("filter_highlight");
				$("#reposts_feed_pool").removeClass("filter_highlight");
		  });

		$("#mentions_feed_pool").bind("ajax:complete", function(et, e){
		    $("#feed_pool").html(e.responseText); // insert content
			$("#mentions_feed_pool").addClass("filter_highlight");
				$("#reposts_feed_pool").removeClass("filter_highlight");
				$("#timeline_feed_pool").removeClass("filter_highlight");
		  });
		$("#reposts_feed_pool").bind("ajax:complete", function(et, e){
		    $("#feed_pool").html(e.responseText); // insert content
			$("#reposts_feed_pool").addClass("filter_highlight");
				$("#mentions_feed_pool").removeClass("filter_highlight ");
				$("#timeline_feed_pool").removeClass("filter_highlight");
		  });
		$("#searches_feed_pool").bind("ajax:complete", function(et, e){
		    $("#feed_pool").html(e.responseText); // insert content
		  });
		$("#lists_feed_pool").bind("ajax:complete", function(et, e){
		    $("#feed_pool").html(e.responseText); // insert content
		  });

		// Settings Filter
		$("#profile_settings_pool").bind("ajax:complete", function(et, e){
		    $("#settings_pool").html(e.responseText); // insert content
		  });
		$("#password_settings_pool").bind("ajax:complete", function(et, e){
		    $("#settings_pool").html(e.responseText); // insert content
		  });


		// Profile Filter
		$("#profile_feed_pool").bind("ajax:complete", function(et, e){
		    $("#profile_pool").html(e.responseText); // insert content
		  });
		$("#favorites_feed_pool").bind("ajax:complete", function(et, e){
		    $("#profile_pool").html(e.responseText); // insert content
		  });
		$("#following_feed_pool").bind("ajax:complete", function(et, e){
		    $("#profile_pool").html(e.responseText); // insert content
		  });
		$("#followers_feed_pool").bind("ajax:complete", function(et, e){
		    $("#profile_pool").html(e.responseText); // insert content
		  });
		$("#lists_feed_pool").bind("ajax:complete", function(et, e){
		    $("#profile_pool").html(e.responseText); // insert content
		  });

		// Settings Filter 
		$("#password_settings_pool").bind("ajax:complete", function(et, e){
		    $("#settings_pool").html(e.responseText); // insert content
		  });
		$("#profile_settings_pool").bind("ajax:complete", function(et, e){
	 		$("#settings_pool").html(e.responseText); // insert content
		  });
		$("#photo_settings_pool").bind("ajax:complete", function(et, e){
	 		$("#settings_pool").html(e.responseText); // insert content
		  });



		$('#jsddm').clickMenu();

		$('#feed_pool').pageless({ totalPages: 10
		                       , url: '/pages#feeder'
		                       , loaderMsg: 'Loading more results'
		                       });


	});



