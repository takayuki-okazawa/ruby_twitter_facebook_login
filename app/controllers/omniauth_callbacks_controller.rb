# coding: utf-8
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all

    user = User.from_omniauth(env["omniauth.auth"])

    #user = User.where(:auth.slice(:provider, :uid))

    if user.present?
      logger.info("************************************** SUCCESS")
      flash.notice = "Success Login!"
      sign_in_and_redirect twitter
    else
      logger.info("************************************** FAILD")
      flash.notice = "Faild Login..."
      flash[:notice] = "gggggggggggg"
      redirect_to new_user_registration_url
    end

    reset_session
  end
  alias_method :twitter, :all

end
