require 'test_helper'

class ShowroomsControllerTest < ActionController::TestCase
  setup do
    @showroom = showrooms(:one)
  end

  teardown do
    Showroom.destroy_all
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showroom" do
    assert_difference('Showroom.count') do
      post :create, showroom: { name: "Showroom three", email: 'showroom3@example.com' }
    end

    assert_redirected_to showroom_path(assigns(:showroom))
  end

  test "should show showroom" do
    get :show, id: @showroom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showroom
    assert_response :success
  end

  test "should update showroom" do
    patch :update, id: @showroom, showroom: { name: @showroom.name }
    assert_redirected_to showroom_path(assigns(:showroom))
  end

  test "should destroy showroom" do
    assert_difference('Showroom.count', -1) do
      delete :destroy, id: @showroom
    end

    assert_redirected_to showrooms_path
  end
end
