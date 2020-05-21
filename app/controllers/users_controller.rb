class UsersController < ApplicationController
  def new
    @users = User.all
    @user = if session[:current_user_id].nil?
              User.new
            else
              User.find(session[:current_user_id])
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
      flash[:alert] = 'User not found.'
      @user = User.new
      render 'sign_in_form'
    end
  end

  def sign_out
    reset_session
    redirect_to root_path
    flash[:alert] = 'User Signed out Successfully'
  end

  def show
    @user = User.find(params[:id])

    @upcoming_events = []
    @previous_events = []
    future_events = Event.upcoming_events(Date.today)
    past_events = Event.previous_events(Date.today)
    @user.invites.each do |invite|
      future_event = invite.event if future_events.include?(invite.event)
      past_event = invite.event if past_events.include?(invite.event)
      @upcoming_events << future_event unless future_event.nil?
      @previous_events << past_event unless past_event.nil?
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
