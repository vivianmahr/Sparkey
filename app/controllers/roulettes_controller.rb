class RoulettesController < ApplicationController
	
	def results
		# Each variable is either nil or 1, where nil is unchecked and 
		# 1 is checked
		@text_val = params[:text]
		@images_val = params[:images]
		@video_val = params[:video]
		
		# Creates an array of vibes 
		@vibes_list = params[:vibes]
		@vibes_list = @vibes_list.gsub(" ", "")
		@vibes_list = @vibes_list.split(",")

		# Variable for parameter testing
		@test_post = Post.find(14)

		@results_asc = Post.order(views: :asc)
	end
end
