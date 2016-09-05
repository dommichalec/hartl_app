require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Sample", last_name: "User",
                    email: "sampleuser@example.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user first name and last name should be present" do
    @user.first_name = "     "
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "user first name and last name should be longer than 1 character" do
    @user.first_name = "a"
    @user.last_name = "b"
    assert_not @user.valid?
  end
end
