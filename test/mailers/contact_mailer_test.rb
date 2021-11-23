require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  def contact_email
    ContactMailer.contact_email("matthew@me.com", "Matthew Casey", "1234567890", @message = "Hello")
  end
end
