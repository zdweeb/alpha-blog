class CategoriesController < ApplicationController
  # before_action :set_article, only: [:edit, :update, :show, :destroy]
   
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    # debugger
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was sucessfully created."
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end

  
end