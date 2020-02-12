class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def index
		@user = current_user
		@book = Book.new
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
		# @books = @user.books.page(params[:page]).reverse_order
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:create] = "You have created book successfully"
			redirect_to user_path(@user)
		else
			render 'show'
		end
	end

	def correct_user
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
