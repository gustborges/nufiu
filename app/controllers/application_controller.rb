class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_cart
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[
        name
        email
        password
        current_password
        address
        address_complement
        suburb_id
        zip_code
        phone
        location_details
      ]
    )

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def current_cart
    if session[:cart]
      @cart = Cart.find(session[:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
      @cart.save
    end
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart] = @cart.id
    @cart.save
  end

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? &&
      !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
