class CommentsController < ApplicationController

  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
	 @comment.user_id = current_user.id
	 if @comment.save
		flash[:success] = "Comment created!"
	 else
		falsh[:error]="Unknown error"
	 end
    redirect_to question_path(@article.question)
  end

  def destroy
    @comment.destroy
    redirect_to  question_path(@article.question)
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end

	 def correct_user
      @article = Article.find(params[:article_id])
	   @comment = @article.comments.find(params[:id])
		current_user?(@comment.user)
	 end
end
