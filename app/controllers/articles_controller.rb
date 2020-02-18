class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    find
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(user_params)
    redirect_to article_path(@article)
  end

  def edit
    find
  end

  def update
    find
    @article.update(user_params)
    redirect_to article_path(@article)
  end

  def destroy
    find
    @article.destroy
    redirect_to articles_path(@articles)
  end

  private

  def find
    @article = Article.find(params[:id])
  end

  def user_params
    params.require(:article).permit([:title, :content])
  end
end
