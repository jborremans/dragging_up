class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  
  before_filter :require_login, :only => [:edit, :delete, :show]
  before_filter :require_admin, :only => [:delete]
  before_filter :require_user,  :only => [:delete]
    # 
    # before_filter :only => [ :update, :destroy ] do |action|
    #     redirect_if_not_authorized(User.find(params[:id]).user_id)
    #     end
  before_filter :require_correct_user, :only => [:show, :edit, :delete]
     def require_correct_user
      u = User.find(params[:id])
      
      if u != @user
           flash[:notice] = "Not authorized"
           redirect_to root_url
      end
  end
  
  # def require_admin
  #   redirect_to root_url, notice: 'Accessible only by administrator' unless current_user.role == "Admin"
  

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the DraggingMailer to send a welcome Email after save
        DraggingMail.welcome_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end



