require "application_system_test_case"

class PrivateAdressesTest < ApplicationSystemTestCase
  setup do
    @private_adress = private_adresses(:one)
  end

  test "visiting the index" do
    visit private_adresses_url
    assert_selector "h1", text: "Private Adresses"
  end

  test "creating a Private adress" do
    visit private_adresses_url
    click_on "New Private Adress"

    fill_in "Other information", with: @private_adress.other_information
    fill_in "Street name", with: @private_adress.street_name
    click_on "Create Private adress"

    assert_text "Private adress was successfully created"
    click_on "Back"
  end

  test "updating a Private adress" do
    visit private_adresses_url
    click_on "Edit", match: :first

    fill_in "Other information", with: @private_adress.other_information
    fill_in "Street name", with: @private_adress.street_name
    click_on "Update Private adress"

    assert_text "Private adress was successfully updated"
    click_on "Back"
  end

  test "destroying a Private adress" do
    visit private_adresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Private adress was successfully destroyed"
  end
end
