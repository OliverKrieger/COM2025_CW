require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @campaign = campaigns(:one)
    @user = users(:one)
  end

  test "should not save empty campaign" do
    campaign = Campaign.new

    campaign.save
    refute campaign.valid?
  end

  test "should save only valid campaign" do
    campaign = Campaign.new
    user = User.new

    campaign.name = "Campaign New"
    campaign.desc = "Campaign description"
    campaign.user_id = users(:one).id

    campaign.save!
    assert campaign.valid?
  end

  test "should not save campaign without title" do
    campaign = Campaign.new

    campaign.desc = "Campaign description"

    campaign.save
    refute campaign.valid?
  end

  test "should not save duplicate name campaign" do
    user = User.new

    campaign1 = Campaign.new
    campaign1.name = "Campaign name"
    campaign1.desc = "Description name"
    campaign1.user_id = users(:one).id
    campaign1.save
    assert campaign1.valid?

    campaign2 = Campaign.new
    campaign2.name = "Campaign name"
    campaign2.desc = "Description name"
    campaign2.user_id = users(:one).id
    campaign2.save
    refute campaign2.valid?
  end
end
