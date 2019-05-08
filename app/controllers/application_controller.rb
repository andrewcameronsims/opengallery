# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :phone, :address, :secret_question, :encrypted_secret, :avatar, :admin, :artist, tags: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :phone, :address, :secret_question, :encrypted_secret, :avatar, :admin, :artist, tags: []])
  end
end
