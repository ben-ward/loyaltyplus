require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
include Devise::TestHelpers

RSpec.describe "activities/index", :type => :view do
  before(:each) do
    @current_user = create(:user)
    2.times do
      FactoryGirl.create(:activity, user: @current_user)
    end
    @activities = @current_user.activities
  end

  it "renders a list of activities" do
    render
    assert_select 'tbody' do
      assert_select 'tr', 2
    end
  end
end
