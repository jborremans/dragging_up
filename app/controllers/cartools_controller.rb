class CartoolsController < ApplicationController
  def create
      # The tool_id you passed in the params hash is used to go find
      # the correct tool in the Tool model.
      @tool = Tool.find(params[:tool_id])
      @cart_item = Cartool.new(tool_id: @tool.id, quantity: 1)
      @cart_item.cart_id = @current_user.cart.id
      if @cart_item.save
        flash[:success] = "Added #{@tool.tool_name} to your cart."
        redirect_to :back
      else
        flash[:error] = "There was an error adding #{@tool.tool_name} to your cart. Could you try again?"
        redirect_to :back
      end
    end

    def destroy
      @cart_item = Cartool.find(params[:id])
      @duplicate = @cart_item
      @cart_item.destroy
      flash[:notice] = "#{@duplicate.tool.tool_name} has been removed from your cart."
      redirect_to :back
    end
end

