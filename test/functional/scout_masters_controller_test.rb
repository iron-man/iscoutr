require 'test_helper'

class ScoutMastersControllerTest < ActionController::TestCase
  setup do
    @scout_master = scout_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scout_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scout_master" do
    assert_difference('ScoutMaster.count') do
      post :create, :scout_master => @scout_master.attributes
    end

    assert_redirected_to scout_master_path(assigns(:scout_master))
  end

  test "should show scout_master" do
    get :show, :id => @scout_master.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @scout_master.to_param
    assert_response :success
  end

  test "should update scout_master" do
    put :update, :id => @scout_master.to_param, :scout_master => @scout_master.attributes
    assert_redirected_to scout_master_path(assigns(:scout_master))
  end

  test "should destroy scout_master" do
    assert_difference('ScoutMaster.count', -1) do
      delete :destroy, :id => @scout_master.to_param
    end

    assert_redirected_to scout_masters_path
  end
end
