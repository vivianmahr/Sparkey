class SessionController < ApplicationController
    def login
        render plain: params[:user].inspect
    end
    def create
        render plain: params[:user].inspect
    end
end
