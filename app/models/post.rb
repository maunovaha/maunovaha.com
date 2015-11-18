class Post
  attr_reader :date, :title, :published, :tags, :index

  def initialize(opts = {})
    @date      = opts[:date]      # TODO: Create as real date
    @title     = opts[:title]     
    @published = opts[:published] # Only published posts are displayed
    @index     = opts[:index]     # Order number of the post, e.g. 0 (first post)
    @tags      = []               # Tags, e.g. "multiplayer", "game"
    opts[:tags].each { |tag| @tags << Tag.new(tag) }
  end

  class << self
    def all(meta)
      posts = {}
      meta.each_with_index do |opts, index| 
        # Example of "posts" format:
        #
        # posts = {  
        #   all:                    [ .. All posts .. ]
        #   "2015/01/02/title-x" => Post.new, 
        #   "xxxx/xx/xx/title-y" => Post.new, 
        #   "xxxx/xx/xx/title-z" => Post.new
        # }
        post            = Post.new(opts.merge(index: index)) 
        posts[:all]   ||= []
        posts[:all]    << post
        posts[post.url] = post
      end
      posts
    end
  end

  def url
    "#{urlsafe_date}/#{urlsafe_title}"
  end

  private

  def urlsafe_date
    date # TODO: Fix when date at proper format
  end

  def urlsafe_title
    title.gsub(/\s+/, "-").downcase
  end
end