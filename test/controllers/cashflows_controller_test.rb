require "test_helper"

class CashflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cashflows_show_url
    assert_response :success
  end

  test "should get update" do
    get cashflows_update_url
    assert_response :success
  end

  test "should get table" do
    get cashflows_table_url
    assert_response :success
  end
end
