class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      ContactMailer.general_message(@contact).deliver
      ContactMailer.personnal_message(@contact).deliver
      redirect_to root_path, notice: "Message envoyé !"
    else
      render :new
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :object, :message)
  end
end