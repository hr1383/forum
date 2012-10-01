// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
$("#post_posttype_question").change(function() {
         $(".account").show();
});
});

$(function() {
$("#post_posttype_complement").change(function() {
         $(".account").hide();
});
});

$(function() {
$("#post_posttype_complaint").change(function() {
         $(".account").show();
});
});
$(function(){
$('#location_select').live('click', function(event){
    event.preventDefault();
    alert($(this).attr('data'));
    var data =$(this).attr('data');
//    data= data.replace("%","<br/>");
    $("#post_company").html("Company<br/>"+data);
    $("#locations").empty();
    
});
});