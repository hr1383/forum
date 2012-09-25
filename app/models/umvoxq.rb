class Umvoxq < ActiveRecord::Base
serialize :scenarios, Array
has_many :comments
end
