class BlogController < ApplicationController
  rescue_from ActionView::MissingTemplate, Blog::PostNotFound, with: :not_found

  def index
    # List all posts summary using paging...
    # or ..
    # Show only newest post with "next & previous" links?
  end

  def show
    @post = @blog.find_post_by_url!(post_url)
    render "blog/posts/#{post_date}/post"
  end

  protected

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def post_date
    "#{params[:year]}/#{params[:month]}/#{params[:day]}"
  end

  def post_url
    "#{post_date}/#{params[:title]}"
  end
end
