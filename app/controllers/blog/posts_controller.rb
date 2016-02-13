module Blog
  class PostsController < ApplicationController
    layout "blog"
    
    rescue_from ActionView::MissingTemplate, Blogger::PostNotFound, with: :not_found

    def index
    end

    def show
      @post = @blogger.find_post_by_url!(post_url)
      render @post.template, layout: "post"
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
end