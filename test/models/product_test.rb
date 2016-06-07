require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Invalid Product without name" do
    invalid_product = Product.new
    invalid_product.description = 'test_content'
    invalid_product.price = 100.9
    invalid_product.status = 1

    assert_not invalid_product.save
    assert invalid_product.invalid?
  end

  test "Invalid Product without descripion" do
    invalid_product = Product.new
    invalid_product.name = 'test_content'
    invalid_product.price = 100.9
    invalid_product.status = 1

    assert_not invalid_product.save
    assert invalid_product.invalid?
  end

  test "Invalid Product without price" do
    invalid_product = Product.new
    invalid_product.description = 'test_content'
    invalid_product.name = 'test-content'
    invalid_product.status = 1

    assert_not invalid_product.save
    assert invalid_product.invalid?
  end

  test "Invalid Product without status" do
    invalid_product = Product.new
    invalid_product.description = 'test_content'
    invalid_product.price = 100.9
    invalid_product.name = 'test_content'

    assert_not invalid_product.save
    assert invalid_product.invalid?
  end

  test "Fixture Inserted " do
    assert_equal 2, Product.all.size
  end
end
