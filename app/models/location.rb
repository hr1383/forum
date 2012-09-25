class Location < ActiveRecord::Base
 
  belongs_to :post
  attr_accessor :address, :category,:name,:postcode,:tel
  
  def initialize(result)
    @address = result["address"]
    @category = result["category"]
    @name = result["name"]
    @postcode = result["postcode"]
    @tel = result["tel"]
  end
end