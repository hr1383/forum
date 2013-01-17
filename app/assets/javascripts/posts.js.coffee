# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#post_posttype_question").change ->
    $(".account").show()
    $("#lbl_question").text "Question"


$ ->
  $("#post_detailinfos_attributes_0_description").focus ->
    $(this).val ""


$ ->
  $("#post_posttype_complement").change ->
    $(".account").hide()
    
    #         $("#lbl_question").html("Praise");
    $("#lbl_question").text "Praise is good for health."


$ ->
  $("#post_posttype_complaint").change ->
    $(".account").show()
    $("#lbl_question").text "What went wrong?"


$ ->
  $("#location_select").live "click", (event) ->
    event.preventDefault()
    data = $(this).attr("name") + "<br/>" + $(this).attr("address") + "<br/>" + $(this).attr("phone") + "<br/>"
    $("#lbl_company").html "Company<br/>" + data
    $("#post_location_attributes_name").val $(this).attr("name")
    alert $("#post_location_attributes_name").val()
    $("#post_location_attributes_address").val $(this).attr("address")
    $("#post_location_attributes_tel").val $(this).attr("phone")
    $("#post_location_attributes_city").val $(this).attr("city")
    $("#post_location_attributes_zipcode").val $(this).attr("zipcode")
    $("#post_location_attributes_email").val $(this).attr("email")
    $("#post_location_attributes_website").val $(this).attr("website")
    $("#post_location_attributes_category").val $(this).attr("category")
    $("#locations").empty()
    alert $("#post_location_attributes_name").val()


$ ->
  $("#new_address_address").change ->
    if @checked
      $(".full_add").show()
    else
      $(".full_add").hide()


$ ->
  $("#btn_new_addr").click ->
    alert "inside"
    name = $("#full_add_name").val()
    $("#post_location_attributes_name").val name
    $("#post_location_attributes_address").val $("#full_add_address").val()
    
    #         $("#post_locations_attributes_0_tel").val($("#full_add_tel").val());
    $("#post_location_attributes_city").val $("#full_add_city").val()
    $("#post_location_attributes_zipcode").val $("#full_add_zipcode").val()
    $("#post_location_attributes_email").val $("#full_add_email").val()
    $("#post_location_attributes_website").val $("#full_add_website").val()
    $("#post_location_attributes_category").val $("#Category").val()
    alert $("#post_location_attributes_category").val()
    output = $("#post_location_attributes_name").val() + "<br/>" + $("#post_location_attributes_address").val() + "<br/>" + $("#post_location_attributes_city") + "<br/>" + $("#post_location_attributes_zipcode").val() + "<br/>" + $("#post_location_attributes_category").val()
    $("#lbl_company").html "Company" + output
    false


$ ->
  $("#btnfindAddress").click ->
    dataString = ""
    
    #built the data string that will be sent with ajax
    dataString += "business_name=" + $("#company").val() + "&"
    dataString += "business_city=" + $("#city").val() + "&"
    dataString += "business_country=" + $("#country").val() + "&"
    dataString += "business_zipcode=" + $("#zipcode").val()
    $.ajax
      type: "GET"
      url: "/locations/search"
      contentType: "application/text; charset=utf-8"
      beforeSend: (xhr) ->
        xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")

      data: dataString
      success: (data) ->
        text_result = ""
        text_result = "<table  id=\"thetable\"><tbody>"
        $.each data, (index, value) ->
          text_result += "<tr>"
          text_result += "<td>" + value.name + "</td>"
          text_result += "<td>" + value.address + "</td>"
          text_result += "<td>" + value.zipcode + "</td>"
          text_result += "<td><a id=\"location_select\" name=\"" + value.name + "\" address=\"" + value.address + "\" phone=\"" + value.tel + "\" zipcode=" + value.zipcode + " website=" + value.website + " city=\"" + value.city + "\" href=\"#\">Select</a></td>"
          text_result += "</tr>"

        
        #$table.append(
        #       $('<tr>')
        #         .append($('<td>').text(value.name))
        #         .append($('<td>').text(value.address))
        #         .append($('<td>').text(value.zipcode))
        #         .append($('<td>').append(
        #           $('<a>').attr('name',value.name).attr('address',value.address)
        #         )
        #    ));
        $("#locations").html text_result

    
    #$('#locations').html($('<div>').append($table).html());
    
    #    dataType: "json",
    #    success: AjaxSucceeded,
    #    error: AjaxFailed
    alert "end of hello"
    false


$ ->
  $("#btnStep1").click ->
    
    #    $("#post_posttype_question").attr("disabled",true);
    #    $("#post_posttype_complaint").attr("disabled",true);
    #    $("#post_posttype_complement").attr("disabled",true);
    #    $("#post_question").attr("disabled",true);
    #    $("#post_description").attr("disabled",true);
    #    $("#post_scenario_").attr("disabled",true);
    badwords = new Array("shit", "fuck", "ass", "asshole")
    badwordsset = {}
    badwordsArray = []
    i = 0
    while i < badwords.length
      badwordsset[badwords[i]] = true
      i++
    found = false
    badArray = {}
    descriptionValue = $("#post_description").val().split(" ")
    i = 0
    while i < descriptionValue.length
      if badwordsset.hasOwnProperty(descriptionValue[i])
        found = true
        badwordsArray.push descriptionValue[i]
      i++
    if found
      alert "Text contains obsecene words." + badwordsArray
      return false
    $("#divstep2").show()
    
    #    $('#divestep2').scrollIntoView();
    false


$ ->
  $("#btnStep2").click ->
    $("#divstep3").show()
    false


     