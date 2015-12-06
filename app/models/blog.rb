class Blog
  include Singleton

  class PostNotFound < StandardError; end

  attr_reader :posts

  def initialize
    meta = []
    YAML.load_stream(File.read("#{Rails.root}/config/blog.yml")) do |doc| 
      meta << doc.symbolize_keys
    end
    @posts = Post.all(meta)
  end

  def find_post_by_url!(url)
    @posts[url] or raise PostNotFound.new('Not Found')
  end

  def latest_posts
    p "picking posts.."
    p posts[:all]

    @posts[:all].last(2)
  end
end