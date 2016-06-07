require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "Fixture Inserted " do
    assert_equal 2, Order.all.size
  end
end
