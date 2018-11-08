class ArticlesController < ApplicationController

  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :admin_user, only: :index
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
	 @question = Question.find(params[:question_id])
    @article = @question.articles.build(article_params)
    @article.user_id = current_user.id
    if @article.save
	 	flash[:success] = "Article created!"
      redirect_to @question
    else
	 	@feed_items = []
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_url
  end

  def vote
  	 @article = Article.find(params[:id])
	 if !current_user.liked? @article
		@article.liked_by current_user
	 else
		@article.unliked_by current_user
	 end
	 respond_to do |format|
		format.html
		format.js
	 end
  end

  private
    def article_params
      params.require(:article).permit(:text, :picture)
    end

	 def correct_user
		@article = current_user.articles.find_by(id: params[:id])
		redirect_to root_url if @article.nil?
	 end

	 def admin_user
	 	redirect_to(root_path) unless current_user.admin?
	 end
end
