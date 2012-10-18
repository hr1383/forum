require 'factual'
class LocationsController < ApplicationController

  
  def search
  
   factual = Factual.new("b07l6Qn9ENAEvAEPYMUOSh3TcusEoEnBgNp7h75K", "102akjlNemaeHVDLGhv8wtcisyf0DbkkzZJVFHhv")
   zipcode= params[:zipcode].strip
   company = params[:company].strip
   city = params[:city].strip
   country = params[:country].strip
   
    if zipcode == ""
    result =  factual.table("places").filters("name" => {"$bw" => company}).filters("locality" => city,"country" =>country).rows
   else 
    result =  factual.table("places").filters("name" => {"$bw" => company},"locality" => city,"country" =>country,"postcode" => zipcode).rows 
   end
#   if  company !="" 
#     puts "inside company"
#     puts company
#     result = result.filters("name" => {"$bw" => company})
#   end
#   if city != ""
#     result = result.filters("locality" => city)
#   end
#   if country !=""  
#     result = result.filters("country" =>country)   
#   end     
#   if zipcode != ""
#    result = result.filters("postcode" => zipcode)
#   end 
#    result =  result.rows 
   
    @locations = Array.new
    result.each do |resultobj|
      location = Location.new
      location.setValues(resultobj)
      puts "---------------"
        puts location.name
      puts "---------------"
     @locations.push(location)
    end
   respond_to do |format|
     format.js
   end
  end
  
end
