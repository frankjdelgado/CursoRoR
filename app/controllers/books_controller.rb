class BooksController < ApplicationController

	before_action :read?, only: :read

	def show
		@book = Book.find(params[:id])

		@read = @book.read_by_user?(current_user)

	end

	def index
		@books = Book.order_by_title
	end

	def new
		@book = Book.new
	end

	def create
		if Book.create(permit_params)
			flash[:notice] = "New Book created succesfully!"	
			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update

		@book = book.find(params[:id])

		if @book.update(permit_params)
			flash[:notice] = "Book updated succesfully!"
			redirect_to users_path
		else
			render "edit"
		end

	end

	def destroy

		@book = Book.find(params[:id])

		if @book.destroy
			flash[:notice] = "Book deleted succesfully"
			redirect_to books_path
		else
			flash[:error] = "There was a problem with your request. Please, try again."
			redirect_to books_path
		end

	end


	#Read
	def read
		book = Book.find(params[:id])	

		book.users << current_user

		redirect_to book_path(book), notice: "Book added to library succesfully!"
	end

	#permit params
	private

	def permit_params
		params.require(:book).permit!
	end

	def read?
		book = Book.find(params[:id])

		if book.read_by_user?(current_user)
			redirect_to book_path(book), notice: "You already have read that book"
		end

	end

end
