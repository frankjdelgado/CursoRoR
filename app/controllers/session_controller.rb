class SessionController < ApplicationController

	skip_before_action :auth!

	def new
		
	end

	def create
		user = User.authenticate(params[:user][:email], params[:user][:password])
		
		unless user.nil?
			session[:user] = user.id
			redirect_to root_url, notice: "Welcome, "+user.name+"!"
		end
	end

	def destroy
		session[:user] = nil
		redirect_to new_session_path
	end

end
