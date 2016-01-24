class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_blog
  before_action :set_subscriber
  
  def set_blog
    @blog ||= Blog.instance
  end

  def set_subscriber
    @subscriber = Subscriber.new
  end
end
