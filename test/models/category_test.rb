require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "validates name" do
    category1 = Category.new
    category2 = Category.new(name: "")
    category3 = Category.new(name: "actual name")

    refute category1.save
    refute category2.save
    assert category3.save
  end
end
