class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,  :trackable, :validatable #:rememberable
#       validates_presence_of :username 
#       validates_length_of :username, :within => 5..10
#       validates_presence_of :firstname
#       validates_length_of :firstname, :within => 2..20
#       validates_presence_of :lastname 
#       validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:username, :firstname, :lastname,  :city, :country, :subscribe, :fbid
 has_many :posts
end
