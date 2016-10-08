require 'test_helper'

class UserUpdateTest < ActionDispatch::IntegrationTest
  def setup
   @user = User.create(first_name: "Sample", last_name: "Example",
                       email: "example@example.com", password: 'password',
                       password_confirmation: 'password')
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { first_name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    first_name = "Dominic"
    last_name = "Michalec"
    email = "dom@me.com"
    patch user_path(@user), params: { user: { first_name:  first_name,
                                              last_name: last_name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }

    assert_not flash.empty?
    assert_redirected_to user_path(@user)
    @user.reload
    assert_equal first_name,  @user.first_name
    assert_equal last_name, @user.last_name
    assert_equal email, @user.email
  end
end
