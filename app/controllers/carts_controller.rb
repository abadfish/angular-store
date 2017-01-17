class CartsController < ApplicationController
  before_action :set_cart

  def show
    render json: @cart
  end

  def index
    @carts = Cart.all
    render json: @carts
  end

  def checkout
    @user = current_user
    update_inventory
    order = @cart.build_order(user_id: current_user.id)
    order.order_total = @cart.total
    @cart.update(status: "submitted")
    @user.cart = nil
    @user.save
    render json: order
  end

  private

  def update_inventory
    @cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      item.save
    end
  end

  def set_cart
    @cart = current_user.cart
  end

end
