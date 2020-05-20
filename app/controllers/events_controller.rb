class EventsController < ApplicationController
  def new
    @event = Event.new
	end
  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:current_user_id]
    @event.date = 'Tomorrow'
    if @event.save
      redirect_to user_path(session[:current_user_id])
    else
      redirect_to root_path
    end
	end
	def show
	end
	def index
  end
  
  private
  
  def event_params
    params.require(:event).permit(:description)
  end
end
