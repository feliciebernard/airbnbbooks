# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome_email

    UserMailer.welcome_email(User.first)
  end

  def request_accepted

    UserMailer.request_accepted(Loan.first)
  end

  def request_declined

    UserMailer.request_declined(User.first)
  end
  def ask_owner_to_borrow_his_book

    UserMailer.ask_owner_to_borrow_his_book(User.first)
  end
end