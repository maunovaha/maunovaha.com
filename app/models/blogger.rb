class Blogger
  include Singleton

  class PostNotFound < StandardError; end

  attr_reader :posts, :tags

  def initialize
    meta = []
    YAML.load_stream(File.read("#{Rails.root}/config/blog.yml")) do |doc| 
      meta << doc.symbolize_keys
    end
    @posts = Post.all(meta)
    @tags = posts_to_tags(@posts[:all])
  end

  def find_post_by_url!(url)
    @posts[url] or raise PostNotFound.new('Not Found')
  end

  def latest_posts(count = 2)
    @posts[:all].reverse.first(count)
  end

  private

  def posts_to_tags(posts)
    Tag.all(posts).sort_by { |k, v| -v.posts.size }
  end
end