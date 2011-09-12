require 'test_helper'

class MeritbadgesControllerTest < ActionController::TestCase
  setup do
    @meritbadge = meritbadges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meritbadges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meritbadge" do
    assert_difference('Meritbadge.count') do
      post :create, :meritbadge => @meritbadge.attributes
    end

    assert_redirected_to meritbadge_path(assigns(:meritbadge))
  end

  test "should show meritbadge" do
    get :show, :id => @meritbadge.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @meritbadge.to_param
    assert_response :success
  end

  test "should update meritbadge" do
    put :update, :id => @meritbadge.to_param, :meritbadge => @meritbadge.attributes
    assert_redirected_to meritbadge_path(assigns(:meritbadge))
  end

  test "should destroy meritbadge" do
    assert_difference('Meritbadge.count', -1) do
      delete :destroy, :id => @meritbadge.to_param
    end

    assert_redirected_to meritbadges_path
  end
end
