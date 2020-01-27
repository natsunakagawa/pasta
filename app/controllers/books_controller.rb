class BooksController < ApplicationController

	before_action :authenticate_user!

	def index
		
	end

	def show
		
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

end
