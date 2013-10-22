require 'factual'
class LocationsController < ApplicationController

  
  def search
    puts params
   factual = Factual.new("b07l6Qn9ENAEvAEPYMUOSh3TcusEoEnBgNp7h75K", "102akjlNemaeHVDLGhv8wtcisyf0DbkkzZJVFHhv")
    if(!params[:business_zipcode].nil?)
   zipcode= params[:business_zipcode].strip
   else
     zipcode=""
   end  
   company = params[:business_name].strip
   city = params[:business_city].strip
   country = "US" #params[:business_country].strip
   
    if zipcode == ""
    result =  factual.table("places").filters("name" => {"$bw" => company}).filters("locality" => city,"country" =>country).rows
   else 
    result =  factual.table("places").filters("name" => {"$bw" => company},"locality" => city,"country" =>country,"postcode" => zipcode).rows 
   end
    @locations = Array.new
    result.each do |resultobj|
      location = Location.new
      location.setValues(resultobj)
      puts "---------------"
        puts location.name
        puts location.category
      puts "---------------"
     @locations.push(location)
    end
     respond_to do |format|
       format.json {render json:@locations}
     end
  end
  
end
