require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_character_url
  #   assert_response :success
  # end

  test "should create character" do
    assert_difference('Character.count') do
      post characters_url, params: { character: { campaign_id: @character.campaign_id, desc: @character.desc, name: @character.name } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should not save empty character" do
    character = Character.new

    character.save
    refute character.valid?
  end

  test "should save valid character" do
    character = Character.new

    character.name = "Character Name"
    character.desc = "Character Description"

    character.save
    assert character.valid?
  end

  test "should show character" do
    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { campaign_id: @character.campaign_id, desc: @character.desc, name: @character.name } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete character_url(@character)
    end

    assert_redirected_to campaigns_url
  end
end
