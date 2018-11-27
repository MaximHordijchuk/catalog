class CategoriesController < ApplicationController
  def show
    render_object(categories: categories, items: items, pagination: pagination_object(items))
  end

  private

  def categories
    @categories ||= Category.all
  end

  def items
    @items ||= Item.joins(:category).where(categories: { alias: params[:category_alias] }).page(params[:page])
  end
end
