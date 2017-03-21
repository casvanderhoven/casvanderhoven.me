class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    if @article.save
      flash[:success] = "Article created!"
      redirect_to @article
    else
      flash[:error] = "It didn't work!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:success] = "The article was successfully saved!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
