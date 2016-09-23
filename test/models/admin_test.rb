require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = Admin.new(name:"Example Admin", email: "admin@example.com")
  end

  test "should be valid" do
    assert @admin.valid?
  end

  test "name should be present" do
    @admin.name = ""
    assert_not @admin.valid?
  end

  test "email should be present" do
    @admin.email= "   "
    assert_not @admin.valid?
  end

  test "name should not be too long" do
    @admin.name = "a"*51
    assert_not @admin.valid?
  end

  test "email should not be too long" do
    @admin.email = "a"*244 + "@example.com"
    assert_not @admin.valid?
  end

  test "email addresses should be unique" do
    duplicate_admin = @admin.dup
    duplicate_admin.email = @admin.email.upcase
    @admin.save
    assert_not duplicate_admin.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @admin.email = mixed_case_email
    @admin.save
    aseert_equl mixed_case_email.downcase, @admin.reload.email
  end

  test "email validation should accept valid addressesmaximum: 255maximum: 255" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @admin.email =valid_address
      assert @admin.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "password should be present (nonblank)" do
    @admin.password = @admin.password.confirmation =" " * 6
    assert_not @admin.valid?
  end

  test "password should have a minimum length" do
    @admin.password = @admin.password_confirmation = "a" * 5
    assert_not @admin.valid?
  end
end
