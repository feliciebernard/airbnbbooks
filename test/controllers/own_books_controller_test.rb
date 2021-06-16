require 'test_helper'

class OwnBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @own_book = own_books(:one)
  end

  test "should get index" do
    get own_books_url
    assert_response :success
  end

  test "should get new" do
    get new_own_book_url
    assert_response :success
  end

  test "should create own_book" do
    assert_difference('OwnBook.count') do
      post own_books_url, params: { own_book: { appreciation: @own_book.appreciation, available: @own_book.available, review: @own_book.review } }
    end

    assert_redirected_to own_book_url(OwnBook.last)
  end

  test "should show own_book" do
    get own_book_url(@own_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_own_book_url(@own_book)
    assert_response :success
  end

  test "should update own_book" do
    patch own_book_url(@own_book), params: { own_book: { appreciation: @own_book.appreciation, available: @own_book.available, review: @own_book.review } }
    assert_redirected_to own_book_url(@own_book)
  end

  test "should destroy own_book" do
    assert_difference('OwnBook.count', -1) do
      delete own_book_url(@own_book)
    end

    assert_redirected_to own_books_url
  end
end
