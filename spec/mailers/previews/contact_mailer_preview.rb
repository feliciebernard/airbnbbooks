# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def general_message

    ContactMailer.general_message(Contact.first)
  end

  def personnal_message

    ContactMailer.personnal_message(Contact.first)
  end

end
