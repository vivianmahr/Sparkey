class Post < ActiveRecord::Base
	has_many :vibes
	has_many :comments
end
