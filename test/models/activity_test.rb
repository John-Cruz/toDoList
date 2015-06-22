require 'test_helper'
require 'minitest/pride'

class ActivityTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)

  end

  test "validates name" do
    activity1 = Activity.new(user_id: @user.id, due_date: "2015-06-19 17:20:00", priority: 0)
    activity2 = Activity.new(user_id: @user.id, due_date: "2015-06-19 17:20:00", priority: 1, name: "")
    activity3 = Activity.new(user_id: @user.id, due_date: "2015-06-19 17:20:00", priority: 2, name: "Actual name")

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "validates priority" do
    activity1 = Activity.new(user_id: @user.id, name: "Actual name", due_date: "2015-06-19 17:20:00")
    activity2 = Activity.new(user_id: @user.id, name: "Actual name", due_date: "2015-06-19 17:20:00", priority: "NaNNaNNaNNaNNaNNaN Batman")
    activity3 = Activity.new(user_id: @user.id, name: "Actual name", due_date: "2015-06-19 17:20:00", priority: 1)

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "should require user_id" do
    activity1 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", priority: 1)
    activity2 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", priority: 2, user_id: @user.id)

    refute activity1.save
    assert activity2.save
  end
end
