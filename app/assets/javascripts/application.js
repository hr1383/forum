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
    alert("hello");
    data = $(this).attr('name')+"<br/>"+$(this).attr('address')+"<br/>"+$(this).attr('phone')+"<br/>"
    alert(data);
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
//         $("#post_locations_attributes_0_tel").val($("#full_add_tel").val());
         $("#post_locations_attributes_0_city").val($("#full_add_city").val());
         $("#post_locations_attributes_0_zipcode").val($("#full_add_zipcode").val());
         $("#post_locations_attributes_0_email").val($("#full_add_email").val());
         $("#post_locations_attributes_0_website").val($("#full_add_website").val());
//         $("#post_locations_attributes_0_category").val($("#full_add_category").val());
        var output = $("#post_locations_attributes_0_name").val()+"<br/>"+$("#post_locations_attributes_0_address").val()+"<br/>"+
                      $("#post_locations_attributes_0_city")+"<br/>"+$("#post_locations_attributes_0_zipcode").val()+"<br/>";
        
         $("#lbl_company").html("Company"+output);
         return false;
         
         
});
});


$(function() {
$("#btnfindAddress").click(function() {
       var dataString = '';
            //built the data string that will be sent with ajax
            dataString += 'business_name='+$('#company').val()+'&';
            dataString += 'business_city='+$('#city').val()+'&';
            dataString += 'business_country='+$('#country').val()+'&';
            dataString += 'business_zipcode='+$('#zipcode').val();
    $.ajax({
    type: "GET",
    url: "/locations/search",
    contentType: "application/text; charset=utf-8",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: dataString, 
    success: function(data){ 
        var text_result="";
        text_result="<table  id=\"thetable\"><tbody>";
        $.each(data,function(index,value){
              text_result+="<tr>";
              text_result+="<td>"+value.name+"</td>";
              text_result+="<td>"+value.address+"</td>";
              text_result+="<td>"+value.zipcode+"</td>";
              text_result+="<td><a id=\"location_select\" name=\""+ value.name+"\" address=\""+value.address+"\" phone=\""+value.tel+"\" zipcode="+value.zipcode+" website="+value.website+" city=\""+value.city+"\" href=\"#\">Select</a></td>";
              text_result+="</tr>";
                    //$table.append(
                    //       $('<tr>')
                    //         .append($('<td>').text(value.name))
                    //         .append($('<td>').text(value.address))
                    //         .append($('<td>').text(value.zipcode))
                    //         .append($('<td>').append(
                    //           $('<a>').attr('name',value.name).attr('address',value.address)
                    //         )
                    //    ));
        });
              $('#locations').html(text_result);
//$('#locations').html($('<div>').append($table).html());

    }
//    dataType: "json",
//    success: AjaxSucceeded,
//    error: AjaxFailed
});

alert("end of hello");
return false;
});
});

$(function() {
$("#btnStep1").click(function() {
//    $("#post_posttype_question").attr("disabled",true);
//    $("#post_posttype_complaint").attr("disabled",true);
//    $("#post_posttype_complement").attr("disabled",true);
//    $("#post_question").attr("disabled",true);
//    $("#post_description").attr("disabled",true);
//    $("#post_scenario_").attr("disabled",true);
    $("#divstep2").show();
//    $('#divestep2').scrollIntoView();
    return false;
});
});


$(function() {
$("#btnStep2").click(function() {
    $("#divstep3").show();
    return false;
});
});
