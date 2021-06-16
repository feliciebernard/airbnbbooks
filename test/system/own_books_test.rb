require "application_system_test_case"

class OwnBooksTest < ApplicationSystemTestCase
  setup do
    @own_book = own_books(:one)
  end

  test "visiting the index" do
    visit own_books_url
    assert_selector "h1", text: "Own Books"
  end

  test "creating a Own book" do
    visit own_books_url
    click_on "New Own Book"

    fill_in "Appreciation", with: @own_book.appreciation
    check "Available" if @own_book.available
    fill_in "Review", with: @own_book.review
    click_on "Create Own book"

    assert_text "Own book was successfully created"
    click_on "Back"
  end

  test "updating a Own book" do
    visit own_books_url
    click_on "Edit", match: :first

    fill_in "Appreciation", with: @own_book.appreciation
    check "Available" if @own_book.available
    fill_in "Review", with: @own_book.review
    click_on "Update Own book"

    assert_text "Own book was successfully updated"
    click_on "Back"
  end

  test "destroying a Own book" do
    visit own_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Own book was successfully destroyed"
  end
end
