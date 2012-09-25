require 'factual'
class LocationsController < ApplicationController

  
  def search
  
   factual = Factual.new("b07l6Qn9ENAEvAEPYMUOSh3TcusEoEnBgNp7h75K", "102akjlNemaeHVDLGhv8wtcisyf0DbkkzZJVFHhv")
   if params[:zipcode] == ""
    result =  factual.table("places").filters("name" => {"$bw" => params[:company]},"locality" => params[:city],"country" =>params[:country]).rows
   else 
    result =  factual.table("places").filters("name" => {"$bw" => params[:company]},"locality" => params[:city],"country" =>params[:country],"postcode" => params[:zipcode]).rows 
   end
    @locations = Array.new
    result.each do |resultobj|
     @locations.push(Location.new(resultobj))
   end
   puts @locations.is_a? Array
   puts "---------------"
   @locations.each do |location|
     puts location.class
   end
   puts "---------------"
   respond_to do |format|
     format.js
   end
  end
  
  def select
    @locations =  (Location.new(params))
    respond_to do |format|
     format.js
   end
  end
end
