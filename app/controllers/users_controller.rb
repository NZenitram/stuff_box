class UsersController < ApplicationController

  def update
  end

  def update_password
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:current_password])
      response = AuthyService.send_verification_code(user.cellphone)
      session[:user_id] = user.id
      session[:new_password] = params[:new_password]
      redirect_to update_password_verify_phone_path
    else
      flash.now[:danger] = "Incorrect username password confirmation"
      render :update
    end
  end

  def verify_phone
  end

  def verify_user
    message = AuthyService.check_verification_code(current_user, params[:verification_code])
    if message == "Verification code is correct."
      current_user.password = session[:new_password]
      current_user.save
      flash[:success] = "Password for #{current_user.username.titleize} successfully changed!"
      redirect_to root_path
    else
      flash.now[:danger] = "Please enter your validation code again, or log in to request another code."
      render :verify_phone
    end
  end
end
