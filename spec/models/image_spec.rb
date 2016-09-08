require 'rails_helper'

describe Image do
  it { should validate_presence_of :image}
  it { should have_many :contributions}
end
