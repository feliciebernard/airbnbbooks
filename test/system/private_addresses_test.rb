require "application_system_test_case"

class PrivateAddressesTest < ApplicationSystemTestCase
  setup do
    @private_address = private_addresses(:one)
  end

  test "visiting the index" do
    visit private_addresses_url
    assert_selector "h1", text: "Private Addresses"
  end

  test "creating a Private address" do
    visit private_addresses_url
    click_on "New Private Address"

    fill_in "Other information", with: @private_address.other_information
    fill_in "Street name", with: @private_address.street_name
    click_on "Create Private address"

    assert_text "Private address was successfully created"
    click_on "Back"
  end

  test "updating a Private address" do
    visit private_addresses_url
    click_on "Edit", match: :first

    fill_in "Other information", with: @private_address.other_information
    fill_in "Street name", with: @private_address.street_name
    click_on "Update Private address"

    assert_text "Private address was successfully updated"
    click_on "Back"
  end

  test "destroying a Private address" do
    visit private_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Private address was successfully destroyed"
  end
end
