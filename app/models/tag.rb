class Tag
  include ApplicationHelper

  attr_accessor :posts
  attr_reader   :name

  def initialize(name)
    @name = name
    @posts = []
  end

  class << self
    def all(posts)
      tags = {}
      posts.each do |post| 
        post.tags.each do |tag|
          tags[tag.name] = Tag.new(tag.name) unless tags.key?(tag.name) # Unique tags
          tags[tag.name].posts << post
        end
      end
      tags
    end
  end

  def hashtag
    "##{@name}"
  end

  def url(with_root: false)
    url  = ""
    url << base_url if with_root
    url << "/blog/tags/#{hashtag}"
  end
end