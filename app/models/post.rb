class Post
  attr_reader :date, :title, :published, :tags

  def initialize(opts = {})
    @date      = opts[:date]
    @title     = opts[:title]
    @published = opts[:published]
    @tags      = []
    opts[:tags].each { |tag| @tags << Tag.new(tag) }
  end

  class << self
    def all(meta)
      posts = []
      meta.each { |post| posts << Post.new(post) }
      posts
    end
  end

  def link
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