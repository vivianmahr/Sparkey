class RoulettesController < ApplicationController
	
	@@text_win = false
	@@image_win = false
	@@video_win = false
	@@triple_lottery_event = false

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
		
		@test_num = count_checkboxes
		
		# Main logic
		roulette_size = 10
		num_checked = count_checkboxes
		posts_per_type = roulette_size / num_checked

		

		if(num_checked == 3)
			@@triple_lottery_event = true

			@@lottery = 1 + rand(3)

			if(@@lottery == 1)
				@@text_win = true
			
			elsif(@@lottery == 2)
				@@image_win = true
			
			elsif(@@lottery == 3)
				@@video_win = true
			end
		end

		text_posts = []
		image_posts = []
		video_posts = []

		if(@text_val)
			
			text_posts = get_text_posts(posts_per_type)
			
			end
		if(@images_val)
			
			image_posts = get_image_posts(posts_per_type)
			
			end
		if(@video_val)
			
			video_posts = get_video_posts(posts_per_type)
			
			end
		

		all_posts = text_posts + image_posts + video_posts
		@result_posts = all_posts.shuffle

	end

	def count_checkboxes
		val_array = [@text_val, @images_val, @video_val]
		counter = 0
		val_array.each do |x|
			if x == "1"
				counter += 1
			end
		end
		return counter
	end

	def get_text_posts(num_posts)

		if(@@triple_lottery_event && @@text_win)
			return result = Post.where(:post_type => "text").limit(num_posts+1)
		end
		# result = Post.where(:post_type => "text").limit(num_posts+1)
		# 	if result == nil
		# 	 	return []
		# 	else 
		# 		return result
		# 	end
		return result = Post.where(:post_type => "text").limit(num_posts)
	end

	def get_image_posts(num_posts)

		if(@@triple_lottery_event && @@text_win)
			return result = Post.where(:post_type => "image").limit(num_posts+1)
		end

		return result = Post.where(:post_type => "image").limit(num_posts)
	end

	def get_video_posts(num_posts)

		if(@@triple_lottery_event && @@text_win)
			return result = Post.where(:post_type => "video").limit(num_posts+1)
		end

		return result = Post.where(:post_type => "video").limit(num_posts)
	end
end
