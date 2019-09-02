class ShopsController < ApplicationController
  def index
    @shops = Shop.where(kind_id: params[:id])
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    #binding.pry
    if @shop.save
      #binding.pry
      redirect_to kinds_path, success: '投稿に成功しました'
    else
      #binding.pry
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
 
  
  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end
  
  private
  def shop_params
    params.require(:shop).permit(:image, :description, :address, :latitude, :longitude, :name, :kind_id)
  end

end
