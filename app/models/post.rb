class Post < ActiveRecord::Base
  belongs_to :users
  attr_accessible :assets_attributes,:posttype, :status, :question, :description, :category, :company, :address, :detailinfo_attributes,  :user_id,:scenario,:compensation,:location_attributes,:resolve_vox
  attr_accessor :url
  validates_presence_of :description,:question,:scenario,:compensation
  has_many :comments , :autosave => true
  has_one :detailinfo
  has_many :assets
  has_one :location
  has_one :updatestatus
  accepts_nested_attributes_for :location, allow_destroy: true
  accepts_nested_attributes_for :detailinfo, allow_destroy: true
  accepts_nested_attributes_for :assets, allow_destroy: true
  
   # searchable do
 #  text :question, :boost => 5
 #   text :description
 end

  def self.latest_closed
    where("status=?",'Resolved').where("posttype=?",'Complaint').order("updated_at DESC").limit(5)
  end
  
  def self.latest_open
    where("status=?",'Open').where("posttype=?",'Complaint').order("created_at DESC").limit(5)
  end
  def urlValue
     Facebook::CALLBACK_URL+"/"+parameterize.to_s
  end
  def self.testimonials
    where("resolve_vox!=?","")
  end
end
