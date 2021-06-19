class UserMailer < ApplicationMailer
  #before_action :set_book_to_borrow, only: %i[ ask_owner_to_borrow_his_book ]
  default from: 'where-is-my-book@yopmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://where-is-my-book.herokuapp.com/' 
    @url_login = 'https://where-is-my-book.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue dans ce nouveau monde qui s\'offre à vous...')
  end

  def ask_owner_to_borrow_his_book(own_book, current_user)

    @book_to_borrow = own_book.book
    @borrower = current_user
    @receiver = own_book.user

    @urls = { home_page: 'https://where-is-my-book.herokuapp.com/', 
              show_book: "https://where-is-my-book.herokuapp.com/own_books/#{@book_to_borrow.id}",
              messagerie: "https://where-is-my-book.herokuapp.com/private_message/#{@receiver.id}",
              profile_page: "https://where-is-my-book.herokuapp.com/users/#{@receiver.id}",
            }

    mail(to: @receiver.email, subject: 
         "Demande d'emprunt du livre #{@book_to_borrow.title} sur WhereIsMyBook")

  end

  def set_book_to_borrow
    @book_to_borrow = OwnBook.find(params[:id])
  end

  def user_mailer_params
    params.require(:user_mailer).permit(:id, :user, :own_book)
  end
end
