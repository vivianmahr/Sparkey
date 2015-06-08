class UsersController < ApplicationController
	
	def user

	end

	def update
		@status = params[:user][:status]
		#redirect_to "/about"
		#render plain: @status
		render plain: current_user[:id]
	end
end
