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

end
