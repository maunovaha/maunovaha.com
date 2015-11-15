module BlogHelper
  def next
    # Return next post url
  end

  def next?
    # Has next post?
  end

  def previous
    # Return previous post url
  end

  def previous?
    # Has previous post?
  end

  def header
    # returns header of a post
    "Example header"
  end

  private

  def tags
    ["#example1", "#example2", "#example3"]
  end
end
