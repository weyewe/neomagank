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
    $("div.actions", $(this)).show();
  } , function(){
    $("div.actions", $(this)).hide();
  });
  
  
  $("li.cv-item").hover( function(){
    $("div.sub-actions", $(this)).show();
  }, function(){
    $("div.sub-actions", $(this)).hide();
  });
  
  $("div.actions a").click(function(){
    if( $(this).hasClass("edit")){
      var $wrapper = $(this).parents(".cv-section");
      var $ul = $("ul.cv-section-items", $wrapper );
      var ul_id = $ul.attr("id");

      var form_id = ul_id + "-form";
      var $form = $("form.cv-section-form", $wrapper);

      $form.show();
      $ul.hide();

      var $action_wrapper = $(this).parents("div.actions");
      $("a.edit", $action_wrapper).hide();
      $("a.cancel", $action_wrapper).show();
    }else if($(this).hasClass("cancel")){
      console.log("I am clicked!");
      var $wrapper = $(this).parents(".cv-section");
      var $ul = $("ul.cv-section-items", $wrapper );
      var ul_id = $ul.attr("id");

      var form_id = ul_id + "-form";
      var $form = $("form.cv-section-form", $wrapper);

      $form.hide();
      $ul.show();

      var $action_wrapper = $(this).parents("div.actions");
      $("a.edit", $action_wrapper).show();
      $("a.cancel", $action_wrapper).hide();
      
    }
    
    return false;
  });
  
});
