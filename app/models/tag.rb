class Tag
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    "##{@name}"
  end

  def url
    "/blog/tags/#{@name}"
  end
end