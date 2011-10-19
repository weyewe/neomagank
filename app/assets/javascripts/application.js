// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require cufon/cufon-yui
//= require cufon/hattori_hanzo.font
//= require tipsy/jquery.tipsy
//= require prettyphoto/jquery.prettyPhoto
//= require uni-form.jquery.min
//= require jquery.prettyLoader
//= require jquery.Jcrop.min
//= require jquery.showLoading.min



$(document).ready( function(){
  // hovering for those without sub-actions

  
  $("div.cv-section, div.portfolio-index-wrapper").live({
    mouseenter:
    function(){
      $("div.actions, div.super-actions", $(this)).show();
    },
    mouseleave:
    function(){
      $("div.actions, div.super-actions", $(this)).hide();
    }
  });
  
  
  // hovering for the subactions

  $("li.cv-item").live({
    mouseenter:
    function(){
      $("div.sub-actions", $(this)).show();
    },
    mouseleave:
    function(){
      $("div.sub-actions", $(this)).hide();
    }
  });
  
  
  // edit for non-subaction
  $("div.actions a").live('click', function(){
    
    if( $(this).hasClass("edit")){
      toggleEntry( this, true );
    }else if($(this).hasClass("cancel")){
      toggleEntry(this, false);
    }
    
    return false;
  });
  
  // add for non-subaction
  $("div.super-actions a").live('click', function(){
    
    if( $(this).hasClass("add")){
      toggleAddEntry( this, true );
    }else if($(this).hasClass("cancel")){
      toggleAddEntry(this, false);
    }
    
    return false;
  });
  
  // edit for subaction
  $("div.sub-actions a").live('click', function(){
    if( $(this).hasClass("edit")){
      toggleEditEntry( this, true );
    }else if($(this).hasClass("cancel")){
      toggleEditEntry(this, false);
    }
    
    return false;
  });
  
  // initialize prettyLoader
  // $.prettyLoader();
  
  //ajax post, only for the CV page
  $("form.ajaxform").live('submit',function(){
    var $this = $(this);
    var destination = $(this).attr('action');
    var $form_container = $this.parent();
    $form_container.showLoading();
  	$.ajax({
  		url: destination,
  		type: "POST",
  		data: $(this).serialize(),
  		dataType: 'script',
  		success: function(response){
  		  $this.clearForm();
  		  $this.hide();
  		  $form_container.hideLoading();
        // reset buttons >> close the cancel, show the edit/delete, etc
        resetActionSelector();
  		}
  	});
  	return false;
  });
  
  // to delete resource
  $('a.delete').live('click', function(event) {
    
    var destroy_url = $(this).attr("href");
    if ( confirm("Are you sure?") ){
      $.ajax({
        url: destroy_url,
        type: 'post',
        dataType: 'script',
        data: { '_method': 'delete' },
        success: function() {
        }
      });
    }
      
  
    return false;
  });
  
  // to add the first profile pic
  $("a#picture-of-you").live('click', function(){
    var $this = $(this);
    if ( $this.hasClass("trigger-profile-form") ){
      console.log("Shit, it has it");
      $("#profile-pic-form").fadeIn();
    }
    
    return false;
  });
  

	
	
});

/* This function toggleEntry is specific for Edit-only button*/
function toggleEntry(clicked_node, has_edit){
  var $clicked_node = $(clicked_node);
  var $wrapper = $clicked_node.parents(".cv-section");
  var $ul = $("ul.cv-section-items", $wrapper );

  var $form = $("form.cv-section-form", $wrapper);
  var $action_wrapper = $clicked_node.parents("div.actions");
  
  
  if(has_edit){
    $form.show();
    $ul.hide();
    $("a.edit", $action_wrapper).hide();
    $("a.cancel", $action_wrapper).show();
    $("a.cancel", $action_wrapper).addClass("cancel_is_visible");
  }else{
    $form.hide();
    $ul.show();
    $("a.edit", $action_wrapper).show();
    $("a.cancel", $action_wrapper).hide();
    $("a.cancel", $action_wrapper).removeClass("cancel_is_visible");
  }
}


// include AUTH_TOKEN before all ajax request 
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});





/* function toggleAddEntry is specific for those cv-sections containing sub entry e.g.: Work Experience*/
/* Use this function to toggle between creating new work experience or cancel the creation */
function toggleAddEntry(clicked_node, has_add){
  var $clicked_node = $(clicked_node);
  var $wrapper = $clicked_node.parents(".cv-section");
  var $new_form = $("form.new-form", $wrapper);
  
  if( has_add ){
    $new_form.show();
    $("div.super-actions a.add", $wrapper).hide();
    $("div.super-actions a.cancel", $wrapper).show();
    $("div.super-actions a.cancel", $wrapper).addClass("cancel_is_visible");
  }else{
    $new_form.hide();
    $("div.super-actions a.add", $wrapper).show();
    $("div.super-actions a.cancel", $wrapper).hide();
    $("div.super-actions a.cancel", $wrapper).removeClass("cancel_is_visible");
  }
}


/* function toggleAddEntry is specific for those cv-sections element such as work experience: 1. driver, 2. teacher, 3.etc*/
/* Use this function to toggle between editing new work experience , deleting or cancel the creation */

function toggleEditEntry(clicked_node, has_edit){
  var $clicked_node = $(clicked_node);
  var $wrapper = $clicked_node.parents(".cv-item");
  var $edit_form = $("form.edit-form", $wrapper);
  
 
  if( has_edit ){
    $edit_form.show();
    
    $("div.sub-actions a.edit", $wrapper).hide();
    $("div.sub-actions a.cancel", $wrapper).show();
    $("div.sub-actions a.cancel", $wrapper).addClass("cancel_is_visible");
    $(".appendix", $wrapper).hide();
    $("div.cv-item-content", $wrapper).hide();
  }else{
    $edit_form.hide();
    
    $("div.sub-actions a.edit", $wrapper).show();
    $("div.sub-actions a.cancel", $wrapper).hide();
    $("div.sub-actions a.cancel", $wrapper).removeClass("cancel_is_visible");
    $(".appendix", $wrapper).show();
    $("div.cv-item-content", $wrapper).show();
  }
}

// clearform function
$.fn.clearForm = function() {
  return this.each(function() {
    var type = this.type, tag = this.tagName.toLowerCase();
    if (tag == 'form')
      return $(':input',this).clearForm();
    if (type == 'text' || type == 'password' || tag == 'textarea')
      this.value = '';
    else if (type == 'checkbox' || type == 'radio')
      this.checked = false;
    else if (tag == 'select')
      this.selectedIndex = -1;
  });
};


function resetActionSelector(){
  $("a.cancel").each(function(){
    var $this =  $(this);
    if( $this.hasClass("cancel_is_visible") ){
      $this.trigger('click');
      $this.removeClass("cancel_is_visible");
    }
  });
  
}


