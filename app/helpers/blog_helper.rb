module BlogHelper
  def prev_post?
    !prev_post.nil?
  end

  def prev_post
    @blogger.posts[:all][@post.index - 1] unless @post.index == 0
  end

  def next_post?
    !next_post.nil?
  end

  def next_post
    @blogger.posts[:all][@post.index + 1]
  end
end