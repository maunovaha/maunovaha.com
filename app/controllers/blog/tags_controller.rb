module Blog
  class TagsController < ApplicationController
    layout "blog"

    def index
      render "tags/index"
    end
  end
end