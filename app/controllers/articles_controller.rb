class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(10)
    respond_with(@articles)
  end

  def category
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc).
      page(params[:page]).per(10)
    render action: 'index'
  end

  def feed
    @articles = Article.order(created_at: :desc).limit(20)
    render layout: false
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :author_id, :category_id)
    end
end
