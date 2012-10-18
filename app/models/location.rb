class Location < ActiveRecord::Base
  belongs_to :posts
  
#  attr_accessor :address,:category,:name,:zipcode,:tel,:city,:email,:website
  def setValues(result)
    puts result
    self.address = result["address"]
    self.category = result["category"]
    self.name = result["name"]
    self.zipcode = result["postcode"]
    self.tel = result["tel"]
    self.city = result["locality"]
    self.email = result["email"]
    self.website = result["website"]
  end
end