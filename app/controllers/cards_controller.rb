class CardsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
    end
  end
  
  def new
    today = Date.today
    monday = today.beginning_of_week
    @card = current_user.cards.find_by_week_starting monday
    if @card.nil?
      @card = current_user.cards.new(:week_starting => monday)
    end
    @days = [] 
    monday.step(today.end_of_week - 2) do |date|
       day = @card.days.find_by_date date
       if day.nil?
         day = @card.days.new(:date => date)
       end
       @days << day
    end
    @card.days = @days
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @card = current_user.cards.create(params[:card])
    submit() unless params[:submit].nil?
    login = current_user.login
    redirect_to :action => 'show', :id => login, :controller => 'users', :format => params[:format]
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
      submit() unless params[:submit].nil?
      respond_to do |format|
        format.html
      end
    end
  end

  def submit
    @card.isSubmitted = true;
    @card.save
    UserMailer.card_submitted(@card).deliver
    @submitted = true
  end
end
