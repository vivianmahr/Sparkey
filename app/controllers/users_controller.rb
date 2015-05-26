class UsersController < ApplicationController
	def index
		#@user = User.all
#		render plain: params[:id]
	end
	def show
		@user = User.where(name: params[:id])
		@user = User.where(name: params[:id])
		#render plain: @user[0][:name]
		#render plain: @user
	end
end
