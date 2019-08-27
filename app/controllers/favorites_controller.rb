class FavoritesController < ApplicationController
  PER = 3
  def index
    @favorite_shops = current_user.favorite_shops
    @favorite_shops = current_user.favorite_shops.page(params[:page]).per(PER)
  end

  def create
    favorite = Favorite.new(user_id: current_user.id, shop_id: params[:shop_id])
    if favorite.save
      redirect_to shop_path(id: params[:shop_id]), success: 'お気に入りに登録しました'
    else
      redirect_to shop_path(id: params[:shop_id]), danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    
    if favorite.destroy
      redirect_to shop_path(id: params[:shop_id]), success: 'お気に入りを削除しました'
    end
  end  
end
