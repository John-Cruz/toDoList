require 'test_helper'
require 'minitest/pride'

class ActivityTest < ActiveSupport::TestCase
  test "validates name" do
    activity1 = Activity.new(due_date: "2015-06-19 17:20:00",position: 0)
    activity2 = Activity.new(due_date: "2015-06-19 17:20:00",position: 1, name: "")
    activity3 = Activity.new(due_date: "2015-06-19 17:20:00",position: 2, name: "Actual name")

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "validates due_date" do
    activity1 = Activity.new(name: "Actual name", position: 0)
    activity2 = Activity.new(name: "Actual name", position: 2, due_date: "2-0-1 7:2:00")
    activity3 = Activity.new(name: "Actual name", position: 3, due_date: "2015-06-19 17:20:00")

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end

  test "validates position" do
    activity1 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00")
    activity2 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", position: "NaNNaNNaNNaNNaNNaN Batman")
    activity3 = Activity.new(name: "Actual name", due_date: "2015-06-19 17:20:00", position: 1)

    refute activity1.save
    refute activity2.save
    assert activity3.save
  end
end
