class Blogger::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :set_categories
  # GET /resource/sign_in
  # def new
  #   super do |resource|
  #     BackgroundWorker.trigger(resource)
  #   end
  # end

  # POST /resource/sign_in
  def create
    # raise(params[:blogger][:email])
    blogger=Blogger.find_by_email(params[:blogger][:email])
    if blogger.active.eql?(true)
        resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        set_flash_message :notice, :signed_in
        sign_in_and_redirect(resource_name, resource)
    else
      flash[:alert]="Tài khoản chưa được kích hoạt"
      redirect_to new_blogger_session_path
    end
  end

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
