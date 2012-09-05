class OrdersController < ApplicationController
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  
  
  def express
     response = EXPRESS_GATEWAY.setup_purchase(Order.new(cart_id: current_cart.id).price_in_cents,
       :ip                => request.remote_ip,
       :return_url        => new_order_url,
       :cancel_return_url => products_url
     )
     redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
   end
   
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = current_cart.build_order(params[:order])
    # @order = Order.new
    #     @order.first_name = params[:order][:first_name]
    #     @order.last_name = params[:order][:last_name]
    #     @order.card_type = params[:order][:card_type]
    #     @order.card_expires_on = params[:order][:card_expires_on]
    @order = Order.new(params[:order])
    @order.cart_id =current_cart.id
    @order.ip_address = request.remote_ip
      if @order.save
       if @order.purchase
         render :action => "success"
         # render :success
       else
         render :action => "failure"
         # render :failure
       end
      else
        render :action => 'new'
        # render :new
      end
    end
  end


  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end


