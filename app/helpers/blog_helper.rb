module BlogHelper
  def newer
    @blog.posts[:all][@post.index - 1]
  end

  def newer?
    @post.index > 0
  end

  def older
    @blog.posts[:all][@post.index + 1]
  end

  def older?
    @post.index < @blog.posts[:all].count - 1
  end
end
