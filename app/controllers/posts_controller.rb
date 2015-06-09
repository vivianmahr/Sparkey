class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	
	def create
	  @uploaded_io = params[:posts][:picture]

	  File.open(Rails.root.join('public', 'uploads', @uploaded_io.original_filename), 'wb') do |file|
	    file.write(@uploaded_io.read)
	  end
	  @title = params[:posts][:title]
	  @description = params[:posts][:text] 
	end
	def post
		@posts = Post.all
		@vibes = Vibe.all

		@posts_with_vibes = Post.find_by_sql "SELECT p.id, p.text_content, 
		v.vibe FROM posts p, vibes v WHERE p.id = v.post_id"
	end
	def show
		@id = params[:id]
		@post = Post.find(@id)
		@vibes = Vibe.where(:post_id => @id)
		@comments = Comment.where(:post_id => @id)
	end

end
