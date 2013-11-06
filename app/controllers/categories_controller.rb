class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = "New category was created."
      redirect_to posts_path
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end