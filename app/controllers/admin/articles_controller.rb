class Admin::ArticlesController < ApplicationController
  before_filter :login_required
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout "admin"

  respond_to :html

  def index
    @articles = Article.all.order(created_at: :desc)
    respond_with([:admin, @article])
  end

  def category
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    respond_with([:admin, @article])
  end

  def new
    @article = Article.new
    respond_with([:admin, @article])
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with([:admin, @article])
  end

  def update
    @article.update(article_params)
    respond_with([:admin, @article])
  end

  def destroy
    @article.destroy
    respond_with([:admin, @article])
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :author_id, :cover, :cover_cache, :category_id)
    end
end
