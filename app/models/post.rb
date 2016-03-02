class Post
  include ApplicationHelper

  attr_reader :date, :title, :published, :tags, :preview, :index

  def initialize(opts = {})
    @date      = opts[:date].to_time
    @title     = opts[:title] 
    @preview   = opts[:preview]    
    @published = opts[:published] # Only published posts are displayed
    @index     = opts[:index]     # Order number of the post, e.g. 0 (first post)
    @tags      = opts[:tags].map { |tag| Tag.new(tag) }
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

  def url(with_root: false)
    url  = ""
    url << base_url if with_root
    url << "/blog/#{urlsafe_date}/#{urlsafe_title}"
  end

  def template
    "blog/posts/#{urlsafe_date}/post"
  end

  def readable_date
    date.strftime("%B%e, %Y")
  end

  def mailer_opts
    {
      title: title,
      url: url(with_root: true),
      date: readable_date,
      preview: preview,
      tags: tags.map do |tag| 
        { 
          name: tag.hashtag, 
          url: tag.url(with_root: true)
        } 
      end
    }
  end

  private

  def urlsafe_date
    date.strftime("%Y/%m/%d")
  end

  def urlsafe_title
    title.gsub(/\s+/, "-").downcase
  end
end