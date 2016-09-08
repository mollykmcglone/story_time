class Story < ActiveRecord::Base
  has_many :contributions
  validates :title, :presence => true
  
end
