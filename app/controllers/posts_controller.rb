class PostsController < ApplicationController
	def post
		@posts = Post.all
		@vibes = Vibe.all

		@posts_with_vibes = Post.find_by_sql "SELECT p.id, p.text_content, v.vibe FROM posts p, vibes v WHERE p.id = v.post_id"
	end
	def show
		@id = params[:id]
		@post = Post.find(@id)
	end

end
