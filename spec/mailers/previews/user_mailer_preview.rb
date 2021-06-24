# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome_email

    UserMailer.welcome_email(User.first)
  end

  def confirmation_email

    UserMailer.confirmation_email(Order.first)
  end

    def request_accepted

    UserMailer.confirmation_email(Order.first)
  end

  def request_declined

    UserMailer.confirmation_email(Order.first)
  end
  def ask_owner_to_borrow_his_book

    UserMailer.confirmation_email(Order.first)
  end
end