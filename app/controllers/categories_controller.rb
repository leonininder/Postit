class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit,:update, :show]

  def new
    @category = Category.new
  end

  def show
    @posts = @category.posts
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Category Created"
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    
  end

  def update
    @category.update(category_params)
    if @category.save
        flash[:notice] = "Category Created"
        redirect_to categories_path
      else
        render :new
      end
    
  end

  def destroy
    
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end