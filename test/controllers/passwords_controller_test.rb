require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = passwords(:one)
  end

  test "should get index" do
    get passwords_url, as: :json
    assert_response :success
  end

  test "should create password" do
    assert_difference('Password.count') do
      post passwords_url, params: { password: { isvalid?: @password.isvalid?, password: @password.password } }, as: :json
    end

    assert_response 201
  end

  test "should show password" do
    get password_url(@password), as: :json
    assert_response :success
  end

  test "should update password" do
    patch password_url(@password), params: { password: { isvalid?: @password.isvalid?, password: @password.password } }, as: :json
    assert_response 200
  end

  test "should destroy password" do
    assert_difference('Password.count', -1) do
      delete password_url(@password), as: :json
    end

    assert_response 204
  end
end
