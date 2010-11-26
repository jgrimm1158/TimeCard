class ManagerController < ApplicationController
  
  def index
    unless current_user.class == Manager 
      redirect_to :action => :show, :controller => :users, :id => current_user.login and return
    end
    @cards = Card.any_in(:user_id => User.where(:department_id => current_user.department.id).only(:id).execute.map(&:id)).where(:is_approved => false, :is_submitted => true)
    @weeks = @cards.all.map(&:week_starting)
  end
  
  def show
    @card = Card.find params[:id]
    @disabled = true
  end
  
  def approve
    @card = Card.find params[:id]
    @card.isApproved = true
    @card.save
    flash[:notice] = "Card approved."
    redirect_to :action => :index
  end
  
end
