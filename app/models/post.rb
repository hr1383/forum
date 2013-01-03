class Post < ActiveRecord::Base
  belongs_to :users
  attr_accessible :assets_attributes,:posttype, :status, :question, :description, :category, :company, :address, :detailinfos_attributes,  :user_id,:scenario,:compensation,:locations_attributes
  attr_accessor :url
#  validates_presence_of :description,:question,:scenario,:compensation
  has_many :comments , :autosave => true
  has_many :detailinfos
  has_many :assets
  has_many :locations
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :detailinfos, allow_destroy: true
  accepts_nested_attributes_for :assets, allow_destroy: true
  
  searchable do
  text :question, :boost => 5
  text :description
end

  def self.latest_closed
    where("status=?",'Resolved').order("updated_at DESC").limit(2)
  end
  
  def self.latest_open
    where("status=?",'Open').order("updated_at DESC").limit(2)
  end
  def urlValue
     Facebook::CALLBACK_URL+id.to_s
  end
end
