class Contribution < ActiveRecord::Base
  belongs_to :story
  belongs_to :image
  validates :username, :sentence, :presence => true
end
