class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session
  protected
  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end
  before_action :set_categories
  def set_categories
    @categories=Category.all
  end


end
