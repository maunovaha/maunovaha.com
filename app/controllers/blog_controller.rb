class BlogController < ApplicationController
  def index
    # List all posts summary using paging...
    # or ..
    # Show only newest post with "next & previous" links?
  end

  def show
    render "blog/posts/"        \
           "#{params[:year]}/"  \
           "#{params[:month]}/" \
           "#{params[:day]}/"   \
           "#{params[:title]}"
  rescue ActionView::MissingTemplate
    not_found!
  end
end
