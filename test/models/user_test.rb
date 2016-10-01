require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Sample", last_name: "User",
                    email: "sampleuser@example.com", password: "foobar",
                    password_confirmation: "foobar")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user first name and last name should be present" do
    @user.first_name = "     "
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "user first name at least 1 character long" do
    @user.first_name = "T"
    assert @user.valid?
  end

  test "user last name should be greater than or equal to 2 characters long" do
    @user.last_name = "A"
    assert_not @user.valid?
  end

  test "user first name and last name shouldn't be longer than 50 characters" do
    @user.first_name = "a"*51
    @user.last_name = "b"*51
    assert_not @user.valid?
  end

  test "user email address should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "user email address should not be longer than 50 characters" do
    @user.email = "a"*51
    assert_not @user.valid?
  end

  test "user email validation should accept valid addresses" do
   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
   valid_addresses.each do |valid_address|
     @user.email = valid_address
     assert @user.valid?, "#{valid_address.inspect} should be valid"
   end
  end

  test "user email address should be unique to the user" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should have a minimum length of 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
end
