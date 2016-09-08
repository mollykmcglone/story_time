class Contribution < ActiveRecord::Base
  belongs_to :story
  belongs_to :image
  validates :username, :presence => true
  validates :sentence, :presence => true, :length => {:maximum => 140}
end
