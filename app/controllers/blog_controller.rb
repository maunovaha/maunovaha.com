class BlogController < ApplicationController
  def index
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
