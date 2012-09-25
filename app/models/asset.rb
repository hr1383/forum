require 'aws/s3'

class Asset < ActiveRecord::Base
  belongs_to :post
  attr_accessible :image
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

end
