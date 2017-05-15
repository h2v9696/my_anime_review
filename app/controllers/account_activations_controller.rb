class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.is_activated? &&
      user.authenticated?(:activation, params[:id])
        user.activate
        log_in user
        flash[:success] = t "success.activation"
        redirect_to user
    else
      flash[:danger] = t "danger.activation"
      redirect_to root_url
    end
  end
end
