require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:two)
  end

  teardown do
    Vehicle.destroy_all
    Showroom.destroy_all
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { arrival_date: @vehicle.arrival_date, name: @vehicle.name, physically_in_showroom: @vehicle.physically_in_showroom, showroom_id: @vehicle.showroom_id }
    end

    # Get last delivered email
    vehicle_email = ActionMailer::Base.deliveries.last
    email_subject = "New vehicle will arrive on #{@vehicle.arrival_date}"
    email_body_part = "Newly consigned vehicle #{@vehicle.name}, will arrived at the #{@vehicle.showroom.name} showroom."

    assert_equal email_subject, vehicle_email.subject
    assert_equal @vehicle.showroom.email, vehicle_email.to[0]
    assert_match(/#{email_body_part}/, vehicle_email.body.to_s)

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { arrival_date: @vehicle.arrival_date, name: @vehicle.name, physically_in_showroom: @vehicle.physically_in_showroom, showroom: @vehicle.showroom }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
