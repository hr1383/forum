// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require rails.validations

//$(function() {
//$("#post_posttype_question").change(function() {
//         $(".account").show();
//         $("#lbl_question").text("Question");
//});
//});
//
//$(function() {
//$("#post_detailinfos_attributes_0_description").focus(function() {
//         $(this).val('');
//});
//});
//
//$(function() {
//$("#post_posttype_complement").change(function() {
//         $(".account").hide();
////         $("#lbl_question").html("Praise");
//         $("#lbl_question").text("Praise is good for health.");
//});
//});
//
//$(function() {
//$("#post_posttype_complaint").change(function() {
//         $(".account").show();
//         $("#lbl_question").text("What went wrong?");
//});
//});
//$(function(){
//$('#location_select').live('click', function(event){
//            event.preventDefault();
//            data = $(this).attr('name')+"<br/>"+$(this).attr('address')+"<br/>"+$(this).attr('phone')+"<br/>"
//         $("#lbl_company").html("Company<br/>"+data)
//         $("#post_location_attributes_name").val($(this).attr('name'));
//         alert($("#post_location_attributes_name").val());
//         $("#post_location_attributes_address").val($(this).attr('address'));
//         $("#post_location_attributes_tel").val($(this).attr('phone'));
//         $("#post_location_attributes_city").val($(this).attr('city'));
//         $("#post_location_attributes_zipcode").val($(this).attr('zipcode'));
//         $("#post_location_attributes_email").val($(this).attr('email'));
//         $("#post_location_attributes_website").val($(this).attr('website'));
//         $("#post_location_attributes_category").val($(this).attr('category'));
//    $("#locations").empty();
//    alert($("#post_location_attributes_name").val());
//    
//});
//});
//
//$(function() {
//$("#new_address_address").change(function() {
//         if(this.checked){
//            $(".full_add").show();
//         }
//         else
//            $(".full_add").hide(); 
//         
//});
//});
//
//
//$(function() {
//$("#btn_new_addr").click(function() {
//    alert("inside")
//         name= $("#full_add_name").val();
//         $("#post_location_attributes_name").val(name);
//         $("#post_location_attributes_address").val($("#full_add_address").val());
////         $("#post_locations_attributes_0_tel").val($("#full_add_tel").val());
//         $("#post_location_attributes_city").val($("#full_add_city").val());
//         $("#post_location_attributes_zipcode").val($("#full_add_zipcode").val());
//         $("#post_location_attributes_email").val($("#full_add_email").val());
//         $("#post_location_attributes_website").val($("#full_add_website").val());
//         $("#post_location_attributes_category").val($("#Category").val());
//         alert($("#post_location_attributes_category").val());
//        var output = $("#post_location_attributes_name").val()+"<br/>"+$("#post_location_attributes_address").val()+"<br/>"+
//                      $("#post_location_attributes_city")+"<br/>"+$("#post_location_attributes_zipcode").val()+"<br/>"+$("#post_location_attributes_category").val();
//        
//         $("#lbl_company").html("Company"+output);
//         return false;
//         
//         
//});
//});
//
//
//$(function() {
//$("#btnfindAddress").click(function() {
//       var dataString = '';
//            //built the data string that will be sent with ajax
//            dataString += 'business_name='+$('#company').val()+'&';
//            dataString += 'business_city='+$('#city').val()+'&';
//            dataString += 'business_country='+$('#country').val()+'&';
//            dataString += 'business_zipcode='+$('#zipcode').val();
//    $.ajax({
//    type: "GET",
//    url: "/locations/search",
//    contentType: "application/text; charset=utf-8",
//    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//    data: dataString, 
//    success: function(data){ 
//        var text_result="";
//        text_result="<table  id=\"thetable\"><tbody>";
//        $.each(data,function(index,value){
//              text_result+="<tr>";
//              text_result+="<td>"+value.name+"</td>";
//              text_result+="<td>"+value.address+"</td>";
//              text_result+="<td>"+value.zipcode+"</td>";
//              text_result+="<td><a id=\"location_select\" name=\""+ value.name+"\" address=\""+value.address+"\" phone=\""+value.tel+"\" zipcode="+value.zipcode+" website="+value.website+" city=\""+value.city+"\" href=\"#\">Select</a></td>";
//              text_result+="</tr>";
//                    //$table.append(
//                    //       $('<tr>')
//                    //         .append($('<td>').text(value.name))
//                    //         .append($('<td>').text(value.address))
//                    //         .append($('<td>').text(value.zipcode))
//                    //         .append($('<td>').append(
//                    //           $('<a>').attr('name',value.name).attr('address',value.address)
//                    //         )
//                    //    ));
//        });
//              $('#locations').html(text_result);
////$('#locations').html($('<div>').append($table).html());
//
//    }
////    dataType: "json",
////    success: AjaxSucceeded,
////    error: AjaxFailed
//});
//
//alert("end of hello");
//return false;
//});
//});
//

$(function() {
$("#btn_sign_up").click(function() {
    var alltrue = true;
    if($("#user_email").val().length == 0){
     $("#error_email").show();
     alltrue= false;
    }
    if($("#user_password").val().length == 0){
     $("#error_pwd").show();
     alltrue= false;
    }
    if($("#user_password_confirmation").val().length == 0){
     $("#error_pwd_c").show();
     alltrue= false;
    }
    if(alltrue == false)
        return false;
})});

$(function(){
$('#user_email').keyup(function(event) {
  $("#error_email").hide();
})
});

$(function(){
$('#user_password').keyup(function(event) {
  $("#error_pwd").hide();
})
});

$(function(){
$('#user_password_confirmation').keyup(function(event) {
  $("#error_pwd_c").hide();
})
});


$(function() {
$("#btnStep1").click(function() {

var alltrue = true;
if($("#post_question").val().length == 0){
     $("#error_question").show();
     alltrue= false;
}
if($("#post_description").val().length == 0){
     $("#error_description").show();
     alltrue= false;
}


//alert($("#post_scenario_").is(':checked'));
//if($("#post_scenario_").is(':checked') == false){
//    $("#error_scenario").show();
//     alltrue= false;
//}
//alert($("#post_compensation_").is(':checked'));
//if($("#post_compensation_").is(':checked') == false){
//    $("#error_compensation").show();
//     alltrue= false;
//}


if(alltrue == false)
    return false;
var badwords = new Array("shit","fuck","ass","asshole");
var badwordsset = {};
var badwordsArray=[];
for(i=0;i<badwords.length;i++){
    badwordsset[badwords[i]]=true;
}
var found = false;
var badArray={};
var descriptionValue = $("#post_description").val().split(" ");
for(i=0;i<descriptionValue.length;i++){
    if(badwordsset.hasOwnProperty(descriptionValue[i])){
        found = true;
        badwordsArray.push(descriptionValue[i]);
    }
}
if(found){
    alert("Text contains obsecene words." +badwordsArray);
    return false;
}
    $("#divstep2").show();
    $("#error_question").hide();
    $("#error_description").hide();
//    $('#divestep2').scrollIntoView();
    return false;
});
});

$(function(){
$('#post_question').keyup(function(event) {
  $("#error_question").hide();
})
});

$(function(){
$('#post_description').keyup(function(event) {
  $("#error_description").hide();
})
});
$(function(){

    $('#user_username').blur(function(event) {
        var dataString = "username="+$('#user_username').val();
     $.ajax({
            type: "GET",
            url: "/members/userp",
            contentType: "application/text; charset=utf-8",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: dataString, 
            success: function(data){ 
                if (data["present"] == 'f'){
                    $('#error_username').show();
                    $('#user_username').focus();
                }else{
                    $('#error_username').hide();
                }
        //$('#locations').html($('<div>').append($table).html());

            }
        //    dataType: "json",
        //    success: AjaxSucceeded,
        //    error: AjaxFailed
        });
    });
});


$(function() {
  return $("#btnStep2").click(function() {
    var alltrue;
    alltrue = true;
    if ($("#new_address").is(':checked') == true) {
      if ($("#post_location_attributes_name").val().length == 0) {
        $("#error_loc_name").show();
        alltrue = false;
      }
      if ($("#post_location_attributes_email").val().length == 0) {
        $("#error_loc_email").show();
        alltrue = false;
      }
      if ($("#post_location_attributes_website").val().length == 0) {
        $("#error_loc_website").show();
        alltrue = false;
      }
    }else{
       if ($("#post_location_attributes_name").val().length == 0) {
            $("#error_loc_name").show();
            alltrue = false;
       } 
       
       if ($("#post_location_attributes_city").val().length == 0) {
            $("#error_loc_city").show();
            alltrue = false;
       } 
        
    }
    if (alltrue === true) {
      $("#divstep3").show();
    }
    return false;
  });
});


$(function(){
$('#post_location_attributes_name').keyup(function(event) {
  $("#error_loc_name").hide();
})
});

$(function(){
$('#post_location_attributes_email').keyup(function(event) {
  $("#error_loc_email").hide();
})
});

$(function(){
$('#post_location_attributes_website').keyup(function(event) {
  $("#error_loc_website").hide();
})
});

$(function(){
$('#post_location_attributes_city').keyup(function(event) {
  $("#error_loc_city").hide();
})
});
//$(function() {
//$("#btnStep2").click(function() {
//    $("#divstep3").show();
//    return false;
//});
//});
//$(document).ready(function() {
//var rows=$('table.checkin').find('tr').length;
//alert(rows);
//var no_rec_per_page=5;
//var no_pages= Math.ceil(rows/no_rec_per_page);
//var $pagenumbers=$('<div id="pages"></div>');
//for(i=0;i<no_pages;i++)
//{
//$('<span class="page">'+(i+1)+'</span>').appendTo($pagenumbers);
//}
//$pagenumbers.insertAfter('table.checkin');
//$('.page').hover(
//function(){
//$(this).addClass('hover');
//},
//function(){
//$(this).removeClass('hover');
//}
//);
//$('table.checkin').find('tr').hide();
//var tr=$('table.checkin tr');
//for(var i=0;i<=no_rec_per_page-1;i++)
//{
//$(tr[i]).show();
//}
//$('span').click(function(event){
//$('table.checkin').find('tr').hide();
//for(i=($(this).text()-1)*no_rec_per_page;i<=$(this).text()*no_rec_per_page-1;i++)
//{
//$(tr[i]).show();
//}
//});
//});