require 'rails_helper'
require 'spec_helper'

RSpec.describe Activity, :type => :model do
  it "is invalid without an amount" do
    expect(FactoryGirl.build(:activity, amount: nil)).not_to be_valid
  end

  it "is invalid without a user" do
    expect(FactoryGirl.build(:activity, user_id: nil)).not_to be_valid
  end

end
