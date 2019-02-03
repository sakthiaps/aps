require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "create a new user" do
    user = User.new({
      :name => 'developer',
      :email => 'developer@gamil.com',
      :password => "developer",
      :role_id => 2
    })
    assert_difference("User.count", 1,
      "Should create one user") do
        user.save!
      end
  end

  test "Should not create a new user" do
    user = User.new({
      :name => 'developer',
      :email => 'developergamil.com',
      :password => "developer",
      :role_id => 2
    })

    assert_not_nil user.valid?, user.errors.full_messages.inspect
  end

  test "Should not create a new user without name" do
    user = User.new({
      :name => '',
      :email => 'developergamil.com',
      :password => "developer",
      :role_id => 2
    })

    assert_not_nil user.valid?, user.errors.full_messages.inspect
  end
end
