class LineItemsController < ApplicationController
  def current_cart
    current_user.try(:current_cart)
  end

  def create
    cart = (current_user.cart ||= current_user.build_cart)
    cart.add_item(params[:item_id]).save
    current_user.save
    render json: { message: 'This item has been added to your cart.' }
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
  end


end
