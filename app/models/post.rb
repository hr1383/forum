class Post < ActiveRecord::Base
  belongs_to :users
  attr_accessible :assets_attributes,:posttype, :status, :question, :description, :category, :company, :address, :detailinfos_attributes,  :user_id,:scenario,:compensation,:locations_attributes
  validates_presence_of :description, :posttype, :status,:category,:scenario, :compensation
  has_many :comments , :autosave => true
  has_many :detailinfos
  has_many :assets
  has_many :locations
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :detailinfos, allow_destroy: true
  accepts_nested_attributes_for :assets, allow_destroy: true
  
  def find_latest_closed
    Post.where("status=?",'Closed').order("updated_at DESC").limit(2)
  end
  
  def find_latest_open
    Post.where("status=?",'Open').order("updated_at DESC").limit(2)
  end
end
