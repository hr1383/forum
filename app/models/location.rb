class Location < ActiveRecord::Base
  belongs_to :post
  searchable do
  text :name
end
#  attr_accessible :address,:category,:name,:zipcode,:tel,:city,:email,:website
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
  
  def locationGroupByName(name)
#    Location.find_by_sql("select count(*), name from locations w")
   locationByCategory = Locations.find(name)
   locationGroupByName={}
   unless locationByCategory.nil?
     locationByCategory.each do |location|
       puts locationByCategory
       puts location
       if locationGroupByName[location.address].nil?
         locationGroupByName[location.address] = [1,location.category]
       else
         someObj = locationGroupByName[location.address]
         someObj = someObj[0].to_i+1
         locationGroupByName[location.address] = someObj
       end
     end
   end
   return locationGroupByName
  end
  
end