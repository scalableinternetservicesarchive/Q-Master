class ArticlesController < ApplicationController

  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
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
    @article = current_user.articles.build(article_params)

    if @article.save
	 	flash[:success] = "Article created!"
      redirect_to @article
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


  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

	 def correct_user
		@article = current_user.articles.find_by(id: params[:id])
		redirect_to root_url if @article.nil?
	 end
end
