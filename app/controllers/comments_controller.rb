class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    #binding.pry
    
      if @comment.save
        redirect_to prototype_path(@comment.prototype)
      else
        @prototype = @comment.prototype
        @comments = @prototype.comments
        render "prototypes/show"
      end   
    #@comment = Comment.new(comment_params)
    #@prototype = @comment.prototype
    # データが保存されたときは詳細ページにリダイレクト
    #if @comment.save
    #  redirect_to prototype_path(@prototype)
    # データが保存されなかったときは詳細ページに戻る
    #else
    #  render "prototypes/show"
    #end
  end


  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id]) #エラーだったときpermit(:comment)になっていた
  end
end
