class CartoolController < ApplicationController
  def create
      @tool = Tool.find(params[:tool_id])
      @cart_item = Cartool.new(tool_id: @beer.id, quantity: 1)
      @cart_item.cart_id = @current_user.cart.id
      if @cart_item.save
        flash[:success] = "Added #{@tool.name} to your cart."
        redirect_to root_url
      else
        flash[:error] = "There was an error adding #{@tool.name} to your cart. Could you try again?"
        redirect_to :back
      end
    end

    def destroy
      @cart_item = Cartool.find(params[:id])
      @dup = Cartool.find(params[:id])
      @cart_item.destroy
      flash[:notice] = "#{@dup.tool.name} has been removed from your cart."
      redirect_to user_url(@current_user)
    end
 
end
