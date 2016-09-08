class Image < ActiveRecord::Base
  has_many :contributions
  validates :image, :presence => true
end
