require 'test_helper'
require 'minitest/pride'

class ActivityTest < ActiveSupport::TestCase
  test "validates name" do
    activity1 = Activity.new(due_date: "2015-06-19 17:20:00", priority: 0)
    activity2 = Activity.new(due_date: "2015-06-19 17:20:00", priority: 1, name: "")
    activity3 = Activity.new(due_date: "2015-06-19 17:20:00", priority: 2, name: "Actual name")

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "validates due_date" do
    activity1 = Activity.new(name: "Actual name", priority: 0)
    activity2 = Activity.new(name: "Actual name", priority: 2, due_date: "2-0-1 7:2:00")
    activity3 = Activity.new(name: "Actual name", priority: 3, due_date: "2015-06-19 17:20:00")

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "validates priority" do
    activity1 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00")
    activity2 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", priority: "NaNNaNNaNNaNNaNNaN Batman")
    activity3 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", priority: 1)

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end
end
