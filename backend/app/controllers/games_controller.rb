class GamesController < ApplicationController
    def index
        @games = Game.all
        gameRender = @games.map{|game| {id: game.id, complete: game.complete, bet_amount: game.bet_amount , user: game.user}}
        render json: gameRender
    end
    def show
        @game = Game.find(params[:id])
        game = [@game].map{|game| {id: game.id, complete: game.complete, bet_amount: game.bet_amount , user: game.user}}
        render json: game
    end
end
