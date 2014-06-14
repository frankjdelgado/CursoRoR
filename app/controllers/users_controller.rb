class UsersController < ApplicationController

	#Show resource
	def index
		@users = User.order_by_name
	end

	def new
		@user = User.new
		@user.build_profile
	end

	#Create New Resource
	def create

		@user = User.new(permit_params)
		if @user.save
			flash[:notice] = "New user created succesfully!"
			redirect_to users_path
		else
			flash[:alert] = @user.errors.full_messages.to_sentence
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


	#Delete resource
	def destroy

		@user = User.find(params[:id])

		if @user.destroy
			flash[:notice] = "User deleted succesfully!"
			redirect_to users_path
		else
			flash[:error] = "There was a problem with your request. Please, try again."
			redirect_to users_path
		end
		
	end

	#Relations
	def profile

		@profile = User.find(params[:id]).profile
		@books = User.find(params[:id]).books.map(&:title).to_sentence

		if(!@profile && !@books)
			flash[:alert] = "That user doesn't have a profile nor books"
			redirect_to users_path
		end

	end

	#permit params
	private

	def permit_params
		params.require(:user).permit!
	end


end
