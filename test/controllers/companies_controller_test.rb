require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get Recommendations" do
    get companies_Recommendations_url
    assert_response :success
  end

  test "should get Users" do
    get companies_Users_url
    assert_response :success
  end

  test "should get Watchlists" do
    get companies_Watchlists_url
    assert_response :success
  end
end
