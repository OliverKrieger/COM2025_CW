require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @campaign = campaigns(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get campaigns_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_url
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { desc: @campaign.desc, name: @campaign.name + "new" } }
    end

    assert_redirected_to campaign_url(Campaign.last)
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

  test "should show campaign" do
    get campaign_url(@campaign)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_url(@campaign)
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { desc: @campaign.desc, name: @campaign.name } }
    assert_redirected_to campaign_url(@campaign)
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign)
    end

    assert_redirected_to campaigns_url
  end
end
