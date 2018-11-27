class ItemsController < ApplicationController
  def show
    item = Item.find_by!(slug: params[:alias])
    render_object(item)
  end
end
