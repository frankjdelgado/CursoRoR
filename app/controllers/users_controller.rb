class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

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

	def update

		@user = User.find(params[:id])

		if @user.update(permit_params)
			flash[:notice] = "User updated succesfully!"
			redirect_to users_path
		else
			render "edit"
		end

	end

	private

	def permit_params
		params.require(:user).permit!
	end

end
