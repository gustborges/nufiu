class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

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
    if verify_recaptcha(action: 'send_message', model: @contact) && @contact.save
      redirect_to contact_path(@contact)
      authorize @contact
      if @contact.message && @contact.subject
        ContactMailer.with(contact: @contact).send_message(@contact.id).deliver_later
      else
        @contact.update(newsletter_subscription: true)
      end
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :message, :name, :email, :phone)
  end
end
