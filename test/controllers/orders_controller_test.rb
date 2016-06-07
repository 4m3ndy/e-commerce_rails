require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @order = orders(:one)
  end

  test "Customer should view his Order List" do
    sign_in(Customer.all.first)
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
    sign_out(Customer.all.first)
  end

  test "Customer should view his Order" do
    sign_in(Customer.all.first)
    get :show, id: @order
    assert_response :success
    sign_out(Customer.all.first)
  end

end
