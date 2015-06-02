class StaticPagesController < ApplicationController
	def splash

	end

	def roulette

	end

	def submit

	end

	def data
		@posts = Post.all
		@comments = Comment.all
		@vibes = Vibe.all
		@users = User.all
	end
end
