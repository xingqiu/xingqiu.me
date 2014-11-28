class Admin::CategoriesController < ApplicationController
  before_filter :login_required, only: [:index]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  layout "admin"

  respond_to :html

  # GET /categories
  def index
    @categories = Category.all
    respond_with([:admin, @categories])
  end

  # GET /categories/1
  def show
    respond_with([:admin, @categories])
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_with([:admin, @categories])
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    @category.save
    respond_with([:admin, @category])
  end

  # PATCH/PUT /categories/1
  def update
    @category.update(category_params)
    respond_with([:admin, @category])
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_with([:admin, @category])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :summary)
    end
end
