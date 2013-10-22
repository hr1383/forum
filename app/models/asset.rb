require 'aws/s3'

class Asset < ActiveRecord::Base
  belongs_to :post
  attr_accessible :image,:image_delete 
  attr_accessor :image_delete
#  before_validation { puts " inside " 
#    image.clear if delete_asset == '1' }
 before_update :destroy_image?
 before_save :save_image?
  has_attached_file :image, :styles => { :medium => "640x480>", 
                                         :thumb => "100x100#"},
  
  :storage => :s3,
#  :s3_credentials => YAML.load_file("#{Rails.root}/config/aws.yml"),
:s3_credentials => {
         :access_key_id => ENV['K1'],
         :secret_access_key => ENV['K2']
       },
  :path => ":attachment/:id/:style.:extension",
  :bucket => 'test_local'

  

#  def image_delete
#    @image_delete ||= "0"
#  end
#
#  def image_delete=(value)
#    @image_delete = value
#  end

private
  def destroy_image?
    puts "UPDAAAAAAATe"
    self.image.clear if @image_delete == "1"
  end
  
  def save_image?
    puts "SAVEEEEEEEE"
  end
end
