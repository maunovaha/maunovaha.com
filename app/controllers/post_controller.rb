class PostController < ApplicationController
  rescue_from ActionView::MissingTemplate, Blog::PostNotFound, with: :not_found

  def show
    @post = @blog.find_post_by_url!(post_url)
    render @post.template
  end

  protected

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def post_url
    "/blog/#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:title]}"
  end
end
