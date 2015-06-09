class RoulettesController < ApplicationController
	
	def results

		# Creates an array of vibes 
		vibes_string_list = params[:vibes]
		vibes_string_list = vibes_string_list.chomp
		vibes_string_list = vibes_string_list.rstrip.lstrip
		vibes_string_list = vibes_string_list.gsub(" ", "")
		vibes_list = vibes_string_list.split(",")
		
		

		

		# Depending on if user entered vibes, return results
		# 	1. If there are one or more vibes, do vibes_search
		# 	2. Else, do default search
		num_posts = 10
		legit_vibes = []
		results_list = Hash.new
		vibes_list.each do |vibe|
			legit_vibes += Vibe.where(:vibe => vibe)
		end
		post = []
		if(vibes_list.size == 1)
			post = Post.where(:id => legit_vibes[0].post_id)
		elsif(vibes_list.size > 1)
			legit_vibes.each do |vibe|
				post += Post.where(:id => vibe.post_id)
			end
		else		
			post = Post.order(views: :asc, created_at: :asc).limit(num_posts)
		end

		post.each do |p|
			p_vibes = Vibe.where(:post_id => p.id)
			results_list[p] = p_vibes
		end

		@final_results_list = results_list
		@roulette = true

		render :template => 'posts/browse'
		
	end
end
