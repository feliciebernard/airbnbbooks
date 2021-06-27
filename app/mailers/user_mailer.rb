class UserMailer < ApplicationMailer

  default from: 'where-is-my-book@yopmail.com'

  def welcome_email(user)

    @user = user
    @url  = 'https://where-is-my-book.herokuapp.com/' 

    mail(to: @user.email, subject: 'Bienvenue dans ce nouveau monde qui s\'offre à vous...')
  end

  def ask_owner_to_borrow_his_book(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.lender)

    mail(to: @lender.email, subject: "Demande d'emprunt du livre #{@own_book.book.title} sur WhereIsMyBook")
  end

  def copy_ask_owner_to_borrow_his_book(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.borrower)

    mail(to: @lender.email, subject: "Demande d'emprunt du livre #{@own_book.book.title} sur WhereIsMyBook")

  end

  def request_accepted(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.borrower)

    mail(to: @borrower.email, subject: "WhereIsMyBook emprunt du livre #{@own_book.book.title} de #{@lender.name} acceptée")
  end

  def request_declined(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.borrower)

    mail(to: @borrower.email, subject: "WhereIsMyBook emprunt du livre #{@own_book.book.title} de #{@lender.name}")
  end

  def book_returned_email_to_owner(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.lender)

    mail(to: @lender.email, subject: "WhereIsMyBook retour du livre #{@own_book.book.title}")

  end

  def book_returned_email_to_borrower(loan)

    set_mail_infos(loan)
    @urls = set_urls(loan.borrower)

    mail(to: @borrower.email, subject: "WhereIsMyBook souhait de retourner le livre #{@own_book.book.title}")
  end

  def set_mail_infos(loan)
    @own_book = loan.own_book
    @lender = loan.lender
    @borrower = loan.borrower
  end

  def set_urls(recipient)
    {
      home_page: 'https://where-is-my-book.herokuapp.com/',
      messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{recipient.id}"
    }
  end

  def set_book_to_borrow
    @book_to_borrow = OwnBook.find(params[:id])
  end

  def user_mailer_params
    params.require(:user_mailer).permit(:id, :user, :own_book)
  end
end
