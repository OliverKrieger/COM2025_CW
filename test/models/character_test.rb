require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @campaign = campaigns(:one)
  end

  test 'should not save empty character' do
    character = Character.new

    character.save
    refute character.valid?
  end

  test 'should save valid character' do
    character = Character.new

    character.name = "My character"
    character.campaign = @campaign

    character.save
    assert character.valid?
  end

  test 'should delete character if campaign is deleted' do
    user = User.new
    campaign = Campaign.new

    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save

    campaign.name = "Campaign New"
    campaign.desc = "Campaign description"
    campaign.user_id = user.id
    campaign.save

    character = Character.new
    character.name = "My character"
    character.campaign = campaign
    character.save

    assert user.valid?
    assert campaign.valid?
    assert character.valid?

    campaign.destroy
    assert campaign.destroyed?
    refute_equal "My character", Character.last.name
  end
  
end
