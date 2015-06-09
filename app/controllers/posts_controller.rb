class PostsController < ApplicationController

	def new
	end

	def show
		@id = params[:id]
		@post = Post.find(@id)
		@post.views += 1
		@post.save
		# User inputted vibes
		vibes_string_list = params[:vibes]

		# Array of vibes that belong to current post
		@post_vibes = Vibe.where(:post_id => @id)

		@vibes_frequency_hash = Hash.new(0)
		@post_vibes.each {|vibe| @vibes_frequency_hash[vibe.vibe] += 1}


		if !vibes_string_list.nil?
			# Make an array of vibes
			vibes_string_list.chomp
			vibes_string_list.gsub(/\t/, '')
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
		else
			render :template => 'posts/post'
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


	def create
	  @post = Post.new
	  @uploaded_io = params[:posts][:picture]

	  File.open(Rails.root.join('public', 'uploads', @uploaded_io.original_filename), 'wb') do |file|
	    file.write(@uploaded_io.read)
	  end
	  #render plain: @post
	  @post[:image_path] = "/uploads/" + @uploaded_io.original_filename
	  @post[:spark_count] = 0
	  @post[:description] = params[:posts][:text] 
	  @post[:views] = 0
	  @post[:post_type] = params[:posts][:title]
	  @post[:user_id] = current_user[:id]
	  #@title = params[:posts][:title]
	  #@description = params[:posts][:text] 
	  @post.save
	  redirect_to '/post/' + @post[:id].to_s
	  #should have redirec to post/id#
	end

	def inc_spark_count
		post = Post.find(params[:id])
		post.spark_count += 1
		post.save
		redirect_to '/post/' + post[:id].to_s
	end
end
