class CommentsController < ApplicationController

	def create

		@book = Book.find(params[:book_id])
		@comment = Comment.new(permit_params)
		@comment.book_id = params[:book_id]
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "New comment added succesfully!"	
			redirect_to book_path(@book)
		else
			flash[:error] = "There was a problem with your request. Please, try again."	
			redirect_to book_path(@book)
		end
	end

	def new
		@book = Book.find(params[:book_id])
		@comment = @book.comments.build
	end


	#permit params
	private

	def permit_params
		params.require(:comment).permit!
	end


end
