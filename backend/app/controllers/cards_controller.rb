class CardsController < ApplicationController
    def index
        @cards = Card.all
        cardRender = @cards.map{|card| {id: card.id, name: card.name, value: card.value , pic: card.pic}}
        render json: cardRender
    end
    def show
        @card = Card.find(params[:id])
        render json: @card
    end
end