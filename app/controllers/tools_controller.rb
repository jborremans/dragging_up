class ToolsController < ApplicationController
  # GET /tools
  # GET /tools.json
  
 before_filter :require_login, :except => [:show, :index]
 # before_filter :require_authorization, :only => [:edit, :delete]
 
 before_filter :require_authorize, :only => [:update, :destroy] 

 before_filter :only => [:update, :destroy] do |action|
   redirect_if_not_authorized(Tool.find(params[:id]).user_id)
 end
 
  
  
  def index
   
    if params[:keyword].present?
      @tools = Tool.where("tool_name LIKE ?", "%#{params[:keyword]}%")
      @tools = Tool.order(:tool_name).page params[:page]
      @tools = Tool.find_all_by_tool_name(params[:keyword])
    else
      @tools = Tool.all
       @tools = Tool.order(:tool_name).page params[:page]
    end

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @tools }
    end
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
    @tool = Tool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tool }
    end
  end

  # GET /tools/new
  # GET /tools/new.json
  def new
    @tool = Tool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tool }
    end
  end

  # GET /tools/1/edit
  def edit
    @tool = Tool.find(params[:id])
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(params[:tool])
    @tool.user_id = session[:user_id]

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render json: @tool, status: :created, location: @tool }
      else
        format.html { render action: "new" }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tools/1
  # PUT /tools/1.json
  def update
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes(params[:tool])
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to tools_url }
      format.json { head :no_content }
    end
  end
end
