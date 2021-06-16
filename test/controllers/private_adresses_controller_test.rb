require 'test_helper'

class PrivateAdressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_adress = private_adresses(:one)
  end

  test "should get index" do
    get private_adresses_url
    assert_response :success
  end

  test "should get new" do
    get new_private_adress_url
    assert_response :success
  end

  test "should create private_adress" do
    assert_difference('PrivateAdress.count') do
      post private_adresses_url, params: { private_adress: { other_information: @private_adress.other_information, street_name: @private_adress.street_name } }
    end

    assert_redirected_to private_adress_url(PrivateAdress.last)
  end

  test "should show private_adress" do
    get private_adress_url(@private_adress)
    assert_response :success
  end

  test "should get edit" do
    get edit_private_adress_url(@private_adress)
    assert_response :success
  end

  test "should update private_adress" do
    patch private_adress_url(@private_adress), params: { private_adress: { other_information: @private_adress.other_information, street_name: @private_adress.street_name } }
    assert_redirected_to private_adress_url(@private_adress)
  end

  test "should destroy private_adress" do
    assert_difference('PrivateAdress.count', -1) do
      delete private_adress_url(@private_adress)
    end

    assert_redirected_to private_adresses_url
  end
end
