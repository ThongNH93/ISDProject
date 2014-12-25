class Blogger::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :set_categories
  # GET /resource/sign_in
  def new
    super do |resource|
      BackgroundWorker.trigger(resource)
    end
  end

  # POST /resource/sign_in
  # def create
  #   super do |resource|
  #     BackgroundWorker.trigger(resource)
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute

  def set_categories
    @categories=Category.all
  end
end
