class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email])
		if user
			login_in user
			redirect_to user
		else
			flash = 'Invalid Email'
			render 'new'
		end
	end
	def destroy
		log_out
		if logged_in?
			redirect_to root_path
		end
	end
end
