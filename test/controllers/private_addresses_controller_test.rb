require 'test_helper'

class PrivateAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_address = private_addresses(:one)
  end

  test "should get index" do
    get private_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_private_address_url
    assert_response :success
  end

  test "should create private_address" do
    assert_difference('PrivateAddress.count') do
      post private_addresses_url, params: { private_address: { other_information: @private_address.other_information, street_name: @private_address.street_name } }
    end

    assert_redirected_to private_address_url(PrivateAddress.last)
  end

  test "should show private_address" do
    get private_address_url(@private_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_private_address_url(@private_address)
    assert_response :success
  end

  test "should update private_address" do
    patch private_address_url(@private_address), params: { private_address: { other_information: @private_address.other_information, street_name: @private_address.street_name } }
    assert_redirected_to private_address_url(@private_address)
  end

  test "should destroy private_address" do
    assert_difference('PrivateAddress.count', -1) do
      delete private_address_url(@private_address)
    end

    assert_redirected_to private_addresses_url
  end
end
