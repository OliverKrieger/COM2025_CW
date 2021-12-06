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

  test 'not logged in user redirects to home from campaign' do
    sign_out @user
    get campaigns_url
    assert_redirected_to new_user_session_url
  end
end
