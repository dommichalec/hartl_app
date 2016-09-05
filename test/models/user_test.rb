require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Sample", last_name: "User",
                    email: "sampleuser@example.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end
end
