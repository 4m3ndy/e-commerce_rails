require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @product = products(:one)
  end

  test "Customer should view all products" do
    sign_in(Customer.all.first)
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    sign_out(Customer.all.first)
  end

  test "Customer should get new request to add a product" do
    sign_in(Customer.all.first)
    get :new
    assert_response :success
    sign_out(Customer.all.first)
  end

  test "should create product" do
    sign_in(Customer.all.first)
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, name: @product.name, price: @product.price, status: @product.status }
    end

    assert_redirected_to product_path(assigns(:product))
    sign_out(Customer.all.first)
  end

  test "Customer should view  request product page" do
    sign_in(Customer.all.first)
    get :show, id: @product
    assert_response :success
    sign_out(Customer.all.first)
  end

  test "Customer should get edit page fpr the product" do
    sign_in(Customer.all.first)
    get :edit, id: @product
    assert_response :success
    sign_out(Customer.all.first)
  end

  test "should update product" do
    sign_in(Customer.all.first)
    patch :update, id: @product, product: { description: @product.description, name: @product.name, price: @product.price, status: @product.status }
    assert_redirected_to product_path(assigns(:product))
    sign_out(Customer.all.first)
  end

end
