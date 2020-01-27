class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
