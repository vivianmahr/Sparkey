class UsersController < ApplicationController
	
	def user

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
			@status = params[:user][:status]
			current_user[:about] = @status
			current_user.save
			#render plain: current_user[:about]
		rescue
		end
		redirect_to "/"
		#@uploaded_io = params[:user][:picture]
		#@status = params[:user][:status]
		#if @uploaded_io.lines(".")[1] == "png"
		    #File.open(Rails.root.join('public', 'profilepictures', @uploaded_io.original_filename), 'wb') do |file|
		    #file.write(@uploaded_io.read)
			#redirect_to "/about"
			#render plain: @status
		#end
		#current_user[:status] = @status
		#render plain: current_user[:id]
		#render plain: @uploaded_io.original_filename.lines(".")[1] == "png"
	end
end
