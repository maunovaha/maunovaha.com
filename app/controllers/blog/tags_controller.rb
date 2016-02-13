module Blog
  class TagsController < ApplicationController
    layout "blog"

    def index
      render "blog/tags/index"
    end
  end
end