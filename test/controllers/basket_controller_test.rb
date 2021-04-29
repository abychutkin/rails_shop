require 'test_helper'

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get basket_index_url
    assert_response :success
  end

  test "should get add_item" do
    get basket_add_item_url
    assert_response :success
  end

  test "should get remove_item" do
    get basket_remove_item_url
    assert_response :success
  end

  test "should get clear" do
    get basket_clear_url
    assert_response :success
  end

  test "should get pay" do
    get basket_pay_url
    assert_response :success
  end

end
