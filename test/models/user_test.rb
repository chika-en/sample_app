require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert@user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not@user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not@user.valid?
  end

  test "name should not to be too long" do
    @user.name = "a" * 51
    assert_not@user.valid?
  end

  test "email should not to be too long" do
    @user.email = "a" * 244 + '@example.com'
    assert_not@user.valid?
  end

  test "email validation should accept valid adresses" do
    valid_adresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_adresses.each do |valid_adress|
      @user.email = valid_adress
      assert@user.valid?,"#{valid_adress.inspect} should be valid"
    end
  end
end
