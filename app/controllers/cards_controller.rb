class CardsController < ApplicationController
  
  def index
    @cards = current_user.cards
    respond_to do |format|
      format.html # show.html.haml
    end
  end
  
  def new
    today = Date.today
    monday = today.beginning_of_week
    @card = current_user.cards.find_or_create_by_week_starting monday
    monday.step(today.end_of_week - 2) do |date|
       day = @card.days.find_or_create_by_date date
    end
    @card.save
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      if not params[:submit].nil?
        @card.isSubmitted = true;
        @card.save
        UserMailer.card_submitted(@card).deliver
        @submitted = true
      end
      respond_to do |format|
        format.html
      end
    end
  end
end
