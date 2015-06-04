class UnsecuredPagesController < ApplicationController
	def splash

	end

	def data
		@posts = Post.all
		@comments = Comment.all
		@vibes = Vibe.all
		@users = User.all
	end
end
