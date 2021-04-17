class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  # def index
  #   @contacts = policy_scope(Contact)
  # end

  def show
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
      authorize @contact
      mail =
        ContactMailer.with(contact: @contact).send_message(@contact).deliver_now
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :message, :name, :email, :phone)
  end
end
