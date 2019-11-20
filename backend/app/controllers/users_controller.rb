class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def index
        @users = User.all
        userRender = @users.map{|user| {id: user.id, name: user.name, money: user.money,games: user.games}}
        render json: userRender
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def new
      @user = User.new(name: params[:name])
    end

    def create 
        @user = User.new(name: params[:name], money: params[:money])
        if @user.save 
            render json: @user
        else
            raise.params.inspect
            render json: @user
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(money: params[:money])
        render json: @user
    end
end
