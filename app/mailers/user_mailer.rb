class UserMailer < ApplicationMailer

  default from: 'where-is-my-book@yopmail.com'

  def welcome_email(user)

    @user = user


    @url  = 'https://where-is-my-book.herokuapp.com/' 
    @url_login = 'https://where-is-my-book.herokuapp.com/users/sign_in'


    mail(to: @user.email, subject: 'Bienvenue dans ce nouveau monde qui s\'offre à vous...')
  end

  def ask_owner_to_borrow_his_book(own_book, current_user)

    @book_to_borrow = own_book.book
    @borrower = current_user
    @receiver = own_book.user

    @urls = { home_page: 'https://where-is-my-book.herokuapp.com/', 
              show_book: "https://where-is-my-book.herokuapp.com/own_books/#{@book_to_borrow.id}",
              messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{@receiver.id}",
              sign_in: "https://where-is-my-book.herokuapp.com/users/#{@receiver.id}",
            }

    mail(to: @receiver.email, subject: "Demande d'emprunt du livre #{@book_to_borrow.title} sur WhereIsMyBook")
  end

    def copy_ask_owner_to_borrow_his_book(own_book, current_user)

    @book_to_borrow = own_book.book
    @borrower = current_user
    @receiver = own_book.user

    @urls = { home_page: 'https://where-is-my-book.herokuapp.com/', 
              show_book: "https://where-is-my-book.herokuapp.com/own_books/#{@book_to_borrow.id}",
              messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{@borrower.id}",
              sign_in: "https://where-is-my-book.herokuapp.com/users/#{@borrower.id}",
            }

    mail(to: @borrower.email, subject: "Envoi de demande d'emprunt du livre #{@book_to_borrow.title} sur WhereIsMyBook")
  end

  def request_accepted(loan)
    @book_to_borrow = loan.own_book
    @owner = loan.lender
    @borrower = loan.borrower


    @urls = { home_page: 'https://where-is-my-book.herokuapp.com/', 
              show_book: "https://where-is-my-book.herokuapp.com/own_books/#{@book_to_borrow.id}",
              messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{@borrower.id}",
              sign_in: "https://where-is-my-book.herokuapp.com/users/#{@borrower.id}"
    }

    mail(to: @borrower.email, subject: "WhereIsMyBook emprunt du livre #{@book_to_borrow.book.title} de #{@owner.name} acceptée")
  end

  def request_declined(loan)

    @book_to_borrow = loan.own_book
    @owner = loan.lender
    @borrower = loan.borrower


    @urls = { home_page: 'https://where-is-my-book.herokuapp.com/', 
              show_book: "https://where-is-my-book.herokuapp.com/own_books/#{@book_to_borrow.id}",
              messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{@borrower.id}",
              sign_in: "https://where-is-my-book.herokuapp.com/users/#{@borrower.id}",
    }

    mail(to: @borrower.email, subject: 
         "WhereIsMyBook emprunt du livre #{@book_to_borrow.book.title} de #{@owner.name}")
  end

  def set_book_to_borrow
    @book_to_borrow = OwnBook.find(params[:id])
  end

  def user_mailer_params
    params.require(:user_mailer).permit(:id, :user, :own_book)
  end
end
