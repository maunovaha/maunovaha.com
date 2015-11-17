class Blog
  include Singleton

  attr_reader :posts

  def initialize
    meta = []
    YAML.load_stream(File.read("#{Rails.root}/config/blog.yml")) do |doc| 
      meta << doc.symbolize_keys
    end
    @posts = Post.all(meta)
  end

  def find_by_url!(params)

    p "Trying to find it with.. #{params}"

    p "My posts: #{@posts.inspect}"
  end
end