class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    current_user = User.find(session[:current_user_id])
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @current_user = User.find(session[:current_user_id]) unless session[:current_user_id].nil?
    @upcoming_events = Event.upcoming_events(Date.today)
    @prev_events = Event.previous_events(Date.today)
  end

  private

  def event_params
    params.require(:event).permit(:description, :location, :date)
  end
end
