class CommentsController < ApplicationController
  def create
     shop = Shop.find(params[:shop_id])
     #binding.pry
     @comment = shop.comments.build(comment_params)
     @comment.user_id = current_user.id
     if @comment.save
      flash[:success] = "コメントしました"
      redirect_to shop_path(id: params[:shop_id])
     else
       flash[:danger] = "コメントできません"
       redirect_to shop_path(id: params[:shop_id])
     end 
  end
  
  def destroy
    # shop = Shop.find(params[:shop_id])
    # comment = shop.comments
    comment = Comment.find(params[:id])
    
    if comment.user_id == current_user.id
      comment.destroy
      redirect_to shop_path(id: params[:shop_id])
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content, :image)
  end 
end
