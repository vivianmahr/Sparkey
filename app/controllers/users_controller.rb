class UsersController < ApplicationController
	
	def user
		@user = current_user;
	end

	def other_user
		@user = current_user;
		render :template => 'users/user'
	end
end
