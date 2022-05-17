class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def show
    # @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to articles_path
  end
  def edit
    # @article = Article.find(params[:id])
  end
  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)
    # No need for app/views/articles/update.html.erb
    redirect_to articles_path
  end
  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    # No need for app/views/articles/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end


  def set_article
    @article = Article.find(params[:id])
  end

end
