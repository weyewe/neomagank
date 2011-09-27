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


$(document).ready( function(){
  
  $("div.cv-section").hover( function(){
    $("div.actions, div.super-actions", $(this)).show();
  } , function(){
    $("div.actions, div.super-actions", $(this)).hide();
  });
  
  
  $("li.cv-item").hover( function(){
    $("div.sub-actions", $(this)).show();
  }, function(){
    $("div.sub-actions", $(this)).hide();
  });
  
  $("div.actions a").click(function(){
    
    if( $(this).hasClass("edit")){
      toggleEntry( this, true );
    }else if($(this).hasClass("cancel")){
      toggleEntry(this, false);
    }
    
    return false;
  });
  
  $("div.super-actions a").click(function(){
    
    if( $(this).hasClass("add")){
      toggleAddEntry( this, true );
    }else if($(this).hasClass("cancel")){
      toggleAddEntry(this, false);
    }
    
    return false;
  });
  
});

/* This function toggleEntry is specific for Edit-only button*/
function toggleEntry(clicked_node, has_edit){
  var $clicked_node = $(clicked_node);
  var $wrapper = $clicked_node.parents(".cv-section");
  var $ul = $("ul.cv-section-items", $wrapper );
  var ul_id = $ul.attr("id");

  var form_id = ul_id + "-form";
  var $form = $("form.cv-section-form", $wrapper);
  var $action_wrapper = $clicked_node.parents("div.actions");
  
  
  if(has_edit){
    $form.show();
    $ul.hide();
    $("a.edit", $action_wrapper).hide();
    $("a.cancel", $action_wrapper).show();
  }else{
    $form.hide();
    $ul.show();
    $("a.edit", $action_wrapper).show();
    $("a.cancel", $action_wrapper).hide();
  }
}

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
  }else{
    $new_form.hide();
    $("div.super-actions a.add", $wrapper).show();
    $("div.super-actions a.cancel", $wrapper).hide();
  }
}


/* function toggleAddEntry is specific for those cv-sections element such as work experience: 1. driver, 2. teacher, 3.etc*/
/* Use this function to toggle between editing new work experience , deleting or cancel the creation */

function toggleEditEntry(clicked_node, has_add){
  var $clicked_node = $(clicked_node);
  var $wrapper = $clicked_node.parents(".cv-item");
  var $new_form = $("form.edit-form", $wrapper);
  
 
  if( has_add ){
    $new_form.show();
    $("div.super-actions a.add", $wrapper).hide();
    $("div.super-actions a.cancel", $wrapper).show();
  }else{
    $new_form.hide();
    $("div.super-actions a.add", $wrapper).show();
    $("div.super-actions a.cancel", $wrapper).hide();
  }
}