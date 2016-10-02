# rails g integration_test user_signup
require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # Make sure that the failed submission re-renders the 'new' action.
    assert_template 'users/new'
    # Test for specific div added by our _error_messages partial.
    assert_select 'div#error_explanation'
    # Test to ensure Rails adds this class to invalid form fields.
    assert_select 'div.field_with_errors'
  end
end
