class CardsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cards = current_user.cards
    render :json => { :success => true, :cards => @cards } 
  end
  
  def new
    today = Date.today
    monday = today.beginning_of_week
    puts monday.class
    @user = current_user
    @card = Card.find_or_initialize_by(:week_starting => monday, :user_id => @user.id, :is_exempt => @user.is_exempt)
    @user.cards << @card
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
    @card = current_user.cards.find(params[:id])
    respond_to do |format|
      format.html 
    end
  end
  
  def update
    @card = current_user.cards.find(params[:id])
    if @card.update_attributes(params[:card])
      flash[:notice] = "Card for #{params[:week_starting]} successfully updated."
      submit() unless params[:submit].nil?
      redirect_to :home
    end
  end

  def submit
    @manager = current_user.manager
    @card.is_submitted = true;
    @card.save
    UserMailer.card_submitted(@card).deliver
    flash[:notice] = "Card for #{params[:week_starting]} has been submitted to your manager, #{@manager.first_name} #{@manager.last_name}."
  end
end
