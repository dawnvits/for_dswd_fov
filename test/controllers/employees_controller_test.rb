require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get active" do
    get :active
    assert_response :success
  end

  test "should get inactive" do
    get :inactive
    assert_response :success
  end

  test "should get administrators" do
    get :administrators
    assert_response :success
  end

end
