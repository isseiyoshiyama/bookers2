class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  def after_sign_in_path_for(resource)
    #登録後に直接飛ぶやつ完成！、
    if current_user
      #少し手間取った、、
      user_path(resource)
    else
      new_user_registration_path
    end
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  #private

  #def user_params
    #params.require(:user).permit(:name, :profile_image)
  #end
end
