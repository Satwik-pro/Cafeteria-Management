class AdminsController < ApplicationController
  def index
    render "index"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      ph_no: params[:ph_no],
      password: params[:password],
      role: "admin",
    )

    if new_user.save
      user = User.find_by(email: params[:email])
      session[:current_user_id] = user.id
      redirect_to admins_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/admins/new"
    end
  end
end
