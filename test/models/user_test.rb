require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end
    
  test 'should save valid user' do
    user = User.new
    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save
    assert user.valid?
  end

  test 'user delete should delete campaign' do
    user = User.new
    campaign = Campaign.new

    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save

    campaign.name = "Campaign New"
    campaign.desc = "Campaign description"
    campaign.user_id = user.id
    campaign.save

    assert user.valid?
    assert campaign.valid?

    user.destroy
    assert user.destroyed?
    refute_equal "Campaign New", Campaign.last.name
  end
end
