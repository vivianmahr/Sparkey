class UsersController < ApplicationController
	
	def user
		@user = current_user;
	end

	def other_user
		username = params.require(:username)
		@user = User.find_by username: username;
		render :template => 'users/user'
	end

		def update
		begin
			@uploaded_io = params[:user][:picture]
	    	to_array = @uploaded_io.original_filename.lines(".")
	    	result_array = []
	    	to_array.each { |x| result_array.push(x) }
			if result_array[1] == "png"
				File.open(Rails.root.join('public', 'profilepictures', current_user[:username] + ".png"), 'wb') do |file|
		    		file.write(@uploaded_io.read)
		    	end
		    end
		rescue
		end

		begin 
			@status = params[:user][:about]
			current_user[:about] = @status
			current_user.save
			#render plain: current_user[:about]
		rescue
		end
		redirect_to "/"
	end
end
