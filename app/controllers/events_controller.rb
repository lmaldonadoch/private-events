class EventsController < ApplicationController
	def new
    @event = Event.new
	end
  def create
    current_user = User.find(session[:current_user_id])
    @event = current_user.events.build(event_params)
    @event.date = 'Tomorrow'
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
  end
  
  private
  
  def event_params
    params.require(:event).permit(:description)
  end
end