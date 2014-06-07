class UsersController < ApplicationController

	#Show resource
	def index
		@users = User.order_by_name
	end

	def new
		@user = User.new
	end

	#Create New Resource
	def create

		if User.create(permit_params)
			flash[:notice] = "New user created succesfully!"
			redirect_to users_path
		else
			render 'new'
		end

	end

	def edit
		@user = User.find(params[:id])
	end

	#Update resource
	def update

		@user = User.find(params[:id])

		if @user.update(permit_params)
			flash[:notice] = "User updated succesfully!"
			redirect_to users_path
		else
			render "edit"
		end

	end


	#permit params
	private

	def permit_params
		params.require(:user).permit!
	end

end
