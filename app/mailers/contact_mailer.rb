class ContactMailer < ApplicationMailer
  default from: "where-is-my-book@yopmail.com"
  
  def general_message(contact)
    @contact = contact

    mail(to: "where-is-my-book@yopmail.com", subject: "Nouvelle demande de contact depuis Where is my Book")
  end
  def personnal_message(contact)
    @contact = contact
    mail(to: @contact.email, subject: "Votre message envoyé depuis Where is my Book")
  end
end
