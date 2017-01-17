class ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def admin

  end

  def index
    @categories = Category.all
    @items = Item.all
    render json: @items
  end

  def admin_index
    @items = Item.all
    render '/items/index'
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.create(item_params)
    # redirect_to item_path(@item)
  end

  def admin_show
    @item = Item.find(params[:id])
    render '/items/show'
  end

  def show
    @item = Item.find(params[:id])
     render json: @item
  end

  def item_data
    @item = Item.find(params[:id])
    render json: @item
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to admin_index_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item deleted."
    redirect_to admin_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end


end
