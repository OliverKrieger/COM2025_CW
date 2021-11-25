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
  
end
