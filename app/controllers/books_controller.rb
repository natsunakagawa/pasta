class BooksController < ApplicationController

	before_action :authenticate_user!

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.new
		@mybook = Book.find(params[:id])
		@user = @mybook.user

	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		if @book.save
			flash[:create] = "You have created book successfully"
			redirect_to book_path(@book)
		else
			@books = Book.all
			render 'index'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
