class Tag
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    "##{@name}" # make this url safe, no need normal tag names?
  end

  def url
    "/blog/tags/#{@name}"
  end
end