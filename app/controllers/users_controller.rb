class UsersController < ApplicationController

  def new
    @users = User.all
    if session[:current_user_id].nil?
      @user = User.new
    else
      @user = User.find(session[:current_user_id])
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def sign_in
    @user = User.find_by(name: params[:user][:name]) unless params[:user].nil?
    if @user
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new
      render 'sign_in_form'
    end
  end

  def sign_out
    reset_session
    redirect_to root_path
  end


  def show
	@user = User.find(params[:id])

	@upcoming_events = [] 
	@user.invites.each do |invite|
	  @upcoming_events << invite.event
	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
