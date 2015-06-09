class PostsController < ApplicationController
	def post
		
	end
	def show
		@id = params[:id]
		@post = Post.find(@id)
		vibes_string_list = params[:vibes]
		@post_vibes = Vibe.where(:post_id => @id)
		if !vibes_string_list.nil?
			# Make an array of vibes
			vibes_string_list = vibes_string_list.gsub(" ", "")
			vibes_list = vibes_string_list.split(",")
			# Associate each vibe to current post
			vibes_list.each do |vibe|
				new_vibe = Vibe.new
				new_vibe.vibe = vibe
				new_vibe.post_id = @id
				new_vibe.save
			end

			redirect_to @post
		end
	end
	def browse
		results_list = Hash.new
		posts = Post.order(views: :asc, created_at: :asc).limit(15)
		posts.each do |p|
			p_vibes = Vibe.where(:post_id => p.id)
			results_list[p] = p_vibes
		end

		@final_results_list = results_list
	end
end
