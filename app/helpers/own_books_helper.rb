module OwnBooksHelper
  def current_user_book?(own_book)
    own_book.user == current_user
  end

  def borrowed_by_current_user?(own_book)
    own_book.loaned.borrower == current_user
  end
end
