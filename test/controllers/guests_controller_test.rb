require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, guest: { company: @guest.company, email: @guest.email, first_name: @guest.first_name, grad_date: @guest.grad_date, last_name: @guest.last_name, major: @guest.major, message: @guest.message, phone_number: @guest.phone_number, subject: @guest.subject }
    end

    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should show guest" do
    get :show, id: @guest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest
    assert_response :success
  end

  test "should update guest" do
    patch :update, id: @guest, guest: { company: @guest.company, email: @guest.email, first_name: @guest.first_name, grad_date: @guest.grad_date, last_name: @guest.last_name, major: @guest.major, message: @guest.message, phone_number: @guest.phone_number, subject: @guest.subject }
    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest
    end

    assert_redirected_to guests_path
  end
end
