class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  def show 
    if not current_user 
      redirect_to(request.referer)
      return
    end
    @user = current_user
    @cards = @user.exempt_cards + @user.hourly_cards
    redirect_to(:controller => 'cards', :action => 'new') and return unless @cards.count > 0
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @user }
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.json { render :json => @user, :status => :created, :location => @user  }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.json { render :json => @user, :status => :created, :location => @user  }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
