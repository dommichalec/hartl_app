require 'test_helper'

class UserSigninTest < ActionDispatch::IntegrationTest
  def setup
   @user = User.create(first_name: "Sample", last_name: "Example",
                       email: "example@example.com", password: 'password',
                       password_confirmation: 'password')
  end
  test "User sign in renders incorrect email/pw combo once" do
    get signin_path
    assert_template 'sessions/new'
    post signin_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
   get signin_path
   post signin_path, params: { session: { email: "example@example.com",
                                         password: 'password' } }
   assert is_logged_in?
   assert_redirected_to @user
   follow_redirect!
   assert_template 'users/show'
   assert_select "a[href=?]", signin_path, count: 0
   assert_select "a[href=?]", signout_path
   assert_select "a[href=?]", user_path(@user)
   delete signout_path
   assert_not is_logged_in?
   assert_redirected_to root_url
   follow_redirect!
   assert_select "a[href=?]", signin_path
   assert_select "a[href=?]", signout_path,      count: 0
   assert_select "a[href=?]", user_path(@user), count: 0
 end
end
