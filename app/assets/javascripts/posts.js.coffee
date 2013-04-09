# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  rows = $("table.checkin").find("tr").length
  no_rec_per_page = 5
  no_pages = Math.ceil(rows / no_rec_per_page)
  $pagenumbers = $("<div id=\"pages\"></div>")
  i = 0
  while i < no_pages
    $("<span class=\"page\">" + (i + 1) + "</span>").appendTo $pagenumbers
    i++
  $pagenumbers.insertAfter "table.checkin"
  $(".page").hover (->
    $(this).addClass "hover"
  ), ->
    $(this).removeClass "hover"

  $("table.checkin").find("tr").hide()
  tr = $("table.checkin tr")
  i = 0

  while i <= no_rec_per_page - 1
    $(tr[i]).show()
    i++
  $("span").click (event) ->
    $("table.checkin").find("tr").hide()
    i = ($(this).text() - 1) * no_rec_per_page
    while i <= $(this).text() * no_rec_per_page - 1
      $(tr[i]).show()
      i++


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
    #alert $("#post_location_attributes_name").val()
    $("#post_location_attributes_address").val $(this).attr("address")
    $("#post_location_attributes_tel").val $(this).attr("phone")
    $("#post_location_attributes_city").val $(this).attr("city")
    $("#post_location_attributes_zipcode").val $(this).attr("zipcode")
    $("#post_location_attributes_email").val $(this).attr("email")
    $("#post_location_attributes_website").val $(this).attr("website")
    #$("#post_location_attributes_category").val $(this).attr("category")
    $("#locations").empty()
    $(".finalcategory").show()
    #alert $("#post_location_attributes_name").val()


$ ->
  $("#new_address").change ->
    if @checked
      $("#notonline").hide()
    else
      $("#notonline").show()


$ ->
  $("#btn_new_addr").click ->
    name = $("#full_add_name").val()
    $("#post_location_attributes_name").val name
    $("#post_location_attributes_address").val $("#full_add_address").val()
    $("#post_location_attributes_city").val $("#full_add_city").val()
    $("#post_location_attributes_zipcode").val $("#full_add_zipcode").val()
    $("#post_location_attributes_email").val $("#full_add_email").val()
    $("#post_location_attributes_website").val $("#full_add_website").val()
    #alert $("#post_location_attributes_category").val()
    output = $("#post_location_attributes_name").val() + "<br/>" + $("#post_location_attributes_address").val() + "<br/>" + $("#post_location_attributes_city").val() + "<br/>" + $("#post_location_attributes_zipcode").val() + "<br/>" + $("#post_location_attributes_category").val()
    $("#lbl_company").html "Company" + "<br/>"+output
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
        $("#locations").html text_result

    
    #$('#locations').html($('<div>').append($table).html());
    
    #    dataType: "json",
    #    success: AjaxSucceeded,
    #    error: AjaxFailed
    false


$ ->
  $("#btnStep1").click ->
    alltrue = true
    if $("#post_posttype_question").is(":empty")
      $(".error_msg").show()
      alltrue = false
    if $("#post_description").is(":empty")
      $(".error_msg").show()
      alltrue = false
    return false  if alltrue is false
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



