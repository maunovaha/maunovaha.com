class BlogController < ApplicationController

  def index
    # List all posts summary using paging...
    # or ..
    # Show only newest post with "next & previous" links?
  end

  def show
    @blog = Blog.instance.find_by_url!(params)

    render "blog/posts/"        \
           "#{params[:year]}/"  \
           "#{params[:month]}/" \
           "#{params[:day]}/"   \
           "post"
  rescue ActionView::MissingTemplate # catch activerecord not found as well?
    not_found!
  end

  private

  def blog_params
    # params.permit() # ...
    # is this needed or not? could return hash for show ...
  end
end
