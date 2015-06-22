require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should require name" do
    user1 = User.new(email: "not@email.com", password: "just_right")
    user2 = User.new(email: "n0t@email.com", password: "just_right", name: "name")
    refute user1.save
    assert user2.save
  end

  test "should require email" do
    user1 = User.new(name: "name", password: "notapassword")
    user2 = User.new(name: "name", password: "notapassword", email: "valid@email.com")
    refute user1.save
    assert user2.save
  end

  test "should require password with length from 4-20" do
    user0 = User.new(name: "name", email: "not@email.com")
    user1 = User.new(name: "name", email: "not@email.com", password: "no")
    user2 = User.new(name: "name", email: "not@email.com", password: "just_right")
    user3 = User.new(name: "name", email: "not@email.com", password: "_____too_____long_____")
    refute user0.save
    refute user1.save
    assert user2.save
    refute user3.save
  end

  test "should link activities with users" do
    user1 = User.create(name: "name", email:"another_real@email.com", password: "just_right")

    assert_equal 0, user1.activities.count

    Activity.create(name: "name", due_date: "2015-06-19 17:20:00", priority: 1, user_id: user1.id)
    Activity.create(name: "name", due_date: "2015-06-19 17:20:00", priority: 2, user_id: user1.id)
    Activity.create(name: "name", due_date: "2015-06-19 17:20:00", priority: 3, user_id: user1.id)

    assert_equal 3, user1.activities.count
  end
end
