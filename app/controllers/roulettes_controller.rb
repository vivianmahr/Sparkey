class RoulettesController < ApplicationController
	
	def results
		@text_val = params[:text]
		@images_val = params[:images]
		@video_val = params[:video]
		@vibes_list = params[:vibes]
		@vibes_list = @vibes_list.gsub(" ", "")
		@vibes_list = @vibes_list.split(",")
	end
end
