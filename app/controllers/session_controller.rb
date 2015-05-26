class SessionController < ApplicationController
    def login
    	@user = User.where(name: params[:id])
        render plain: params[:user].inspect
    end
    def create
    	# Assert pw == pw2 -> pseudocode, not ruby
    	#render plain: params[:user].inspect
        @user = User.new(user_params)
        @user.save
        render plain: @user.inspect
    end

    def show
    	#@user = User.find(params[:id])
 	end

    private
	    def user_params 
	    	params.require(:user).permit(:name, :password)
	    end
end



=begin


def create
  @article = Article.new(article_params)
 
  @article.save
  redirect_to @article
end
 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
    t.string   "name"
    t.string   "password"
    t.integer  "sparks"
    t.integer  "hmms"
    t.datetime "created_at"
    t.datetime "updated_at"	
    {"username"=>"", "email"=>"", "password_1"=>"", "password_2"=>""}
=end
