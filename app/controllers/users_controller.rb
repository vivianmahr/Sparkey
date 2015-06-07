class UsersController < ApplicationController
	
	def user
		@user = current_user;
	end

	def other_user
		username = params.require(:username)
		@user = User.find_by username: username;
		render :template => 'users/user'
	end
end
