// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//$(document).ready(function() {
//  $('full_add').hide();
//});
$(function() {
$("#post_posttype_question").change(function() {
         $(".account").show();
         $("#lbl_question").text("Question");
});
});

$(function() {
$("#post_detailinfos_attributes_0_description").focus(function() {
         $(this).val('');
});
});

$(function() {
$("#post_posttype_complement").change(function() {
         $(".account").hide();
//         $("#lbl_question").html("Praise");
         $("#lbl_question").text("Praise is good for health.");
});
});

$(function() {
$("#post_posttype_complaint").change(function() {
         $(".account").show();
         $("#lbl_question").text("What went wrong?");
});
});
$(function(){
$('#location_select').live('click', function(event){
    event.preventDefault();
    alert($(this).attr('address'));
    data = $(this).attr('name')+"<br/>"+$(this).attr('address')+"<br/>"+$(this).attr('phone')+"<br/>"
//    var data =$(this).attr('data');
//    data= data.replace("%","<br/>");
    $("#lbl_company").html("Company<br/>"+data)
         $("#post_locations_attributes_0_name").val($(this).attr('name'));
         $("#post_locations_attributes_0_address").val($(this).attr('address'));
         $("#post_locations_attributes_0_tel").val($(this).attr('phone'));
         $("#post_locations_attributes_0_city").val($(this).attr('city'));
         $("#post_locations_attributes_0_zipcode").val($(this).attr('zipcode'));
         $("#post_locations_attributes_0_email").val($(this).attr('email'));
         $("#post_locations_attributes_0_website").val($(this).attr('website'));
         $("#post_locations_attributes_0_category").val($(this).attr('category'));
    $("#locations").empty();
    
});
});

$(function() {
$("#new_address_address").change(function() {
         if(this.checked){
             alert("dfdfd");
            $(".full_add").show();
         }
         else
            $(".full_add").hide(); 
         
});
});


$(function() {
$("#btn_new_addr").click(function() {
    alert("inside")
         name= $("#full_add_name").val();
         $("#post_locations_attributes_0_name").val(name);
         $("#post_locations_attributes_0_address").val($("#full_add_address").val());
         $("#post_locations_attributes_0_tel").val($("#full_add_tel").val());
         $("#post_locations_attributes_0_city").val($("#full_add_city").val());
         $("#post_locations_attributes_0_zipcode").val($("#full_add_zipcode").val());
         $("#post_locations_attributes_0_email").val($("#full_add_email").val());
         $("#post_locations_attributes_0_website").val($("#full_add_website").val());
         $("#post_locations_attributes_0_category").val($("#full_add_category").val());
         
         
         
});
});