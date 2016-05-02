class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  config.serve_static_assets = true
  protect_from_forgery with: :exception
  before_action :get_categories, :new_arrivals, :best_sellers, only: [:show, :index, :search]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token, :only => :create

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
                                                            :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
                                                                   :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end


  def get_categories
Rails.logger.debug "Test"
Rails.logger.debug "Param: "
    @categories = Category.all
Rails.logger.debug "Category : #{@categories.inspect}"
  end

  def new_arrivals
    @new_arrivals = Product.new_arrival
  end

  def best_sellers
    @best_sellers = Product.best_seller
  end

end
