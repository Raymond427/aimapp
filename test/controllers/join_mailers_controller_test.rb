require 'test_helper'

class JoinMailersControllerTest < ActionController::TestCase
  setup do
    @join_mailer = join_mailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:join_mailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create join_mailer" do
    assert_difference('JoinMailer.count') do
      post :create, join_mailer: { email: @join_mailer.email, first_name: @join_mailer.first_name, grad_date: @join_mailer.grad_date, last_name: @join_mailer.last_name, major: @join_mailer.major, message: @join_mailer.message, phone_number: @join_mailer.phone_number }
    end

    assert_redirected_to join_mailer_path(assigns(:join_mailer))
  end

  test "should show join_mailer" do
    get :show, id: @join_mailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @join_mailer
    assert_response :success
  end

  test "should update join_mailer" do
    patch :update, id: @join_mailer, join_mailer: { email: @join_mailer.email, first_name: @join_mailer.first_name, grad_date: @join_mailer.grad_date, last_name: @join_mailer.last_name, major: @join_mailer.major, message: @join_mailer.message, phone_number: @join_mailer.phone_number }
    assert_redirected_to join_mailer_path(assigns(:join_mailer))
  end

  test "should destroy join_mailer" do
    assert_difference('JoinMailer.count', -1) do
      delete :destroy, id: @join_mailer
    end

    assert_redirected_to join_mailers_path
  end
end
