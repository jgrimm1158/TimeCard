class CardsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cards = current_user.cards
    respond_to do |format|
      format.html
    end
  end
  
  def new
    today = Date.today
    monday = today.beginning_of_week
    puts monday.class
    cards = current_user.is_exempt ? current_user.exempt_cards : current_user.hourly_cards
    @card = cards.find_or_initialize_by(:week_starting => monday, :user => current_user)
    @card.create_days
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
    @card = current_user.exempt_cards.find(params[:id]) or current_user.hourly_cards.find(params[:id])
    respond_to do |format|
      format.html 
    end
  end
  
  def update
    @card = current_user.exempt_cards.find(params[:id]) or current_user.hourly_cards.find(params[:id])
    if @card.update_attributes(params[:card])
      flash[:notice] = "Card for #{params[:week_starting]} successfully updated."
      submit() unless params[:submit].nil?
      redirect_to :user
    end
  end

  def submit
    manager = current_user.manager
    @card.isSubmitted = true;
    @card.save
    UserMailer.card_submitted(@card).deliver
    flash[:notice] = "Card for #{params[:week_starting]} has been submitted to your manager, #{manager.first_name} #{manager.last_name}."
  end
end
