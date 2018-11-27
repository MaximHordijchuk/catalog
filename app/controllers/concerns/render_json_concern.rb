module RenderJsonConcern
  extend ActiveSupport::Concern

  private

  def render_object(object, options = {})
    render({ json: object }.merge(options))
  end

  def pagination_object(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
