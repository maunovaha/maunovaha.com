class Post
  attr_reader :date, :title, :published, :tags, :index

  def initialize(opts = {})
    @date      = opts[:date]      # TODO: Create as real date
    @title     = opts[:title]     
    @published = opts[:published] # Only published posts are displayed
    @index     = opts[:index]     # Order number of the post, e.g. 0 (first post)
    @tags      = []               
    opts[:tags].each { |tag| @tags << Tag.new(tag) }
  end

  class << self
    def all(meta)
      # Example of "posts" format:
      #
      # posts = {  
      #   all:                    [ .. All posts .. ]
      #   "2015/01/02/title-x" => Post.new, 
      #   "xxxx/xx/xx/title-y" => Post.new, 
      #   "xxxx/xx/xx/title-z" => Post.new
      # }
      posts = {
        all: []
      }
      meta.each do |opts| 
        if opts[:published] || Rails.env.development?
          post            = Post.new(opts.merge(index: posts[:all].size)) 
          posts[:all]    << post
          posts[post.url] = post
        end
      end
      posts
    end
  end

  def url
    "/blog/#{urlsafe_date}/#{urlsafe_title}"
  end

  def template
    "blog/posts/#{urlsafe_date}/post"
  end

  private

  def urlsafe_date
    date # TODO: Fix when date at proper format
  end

  def urlsafe_title
    title.gsub(/\s+/, "-").downcase
  end
end