require 'test_helper'

class TripCitiesControllerTest < ActionController::TestCase
  setup do
    @trip_city = trip_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_city" do
    assert_difference('TripCity.count') do
      post :create, trip_city: @trip_city.attributes
    end

    assert_redirected_to trip_city_path(assigns(:trip_city))
  end

  test "should show trip_city" do
    get :show, id: @trip_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_city
    assert_response :success
  end

  test "should update trip_city" do
    put :update, id: @trip_city, trip_city: @trip_city.attributes
    assert_redirected_to trip_city_path(assigns(:trip_city))
  end

  test "should destroy trip_city" do
    assert_difference('TripCity.count', -1) do
      delete :destroy, id: @trip_city
    end

    assert_redirected_to trip_cities_path
  end
end
