require 'rails_helper'

describe Contribution do
  it { should validate_presence_of :username}
  it { should validate_presence_of :sentence}
  it { should belong_to :story}
  it { should belong_to :image}
end
