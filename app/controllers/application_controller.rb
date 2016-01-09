class ApplicationController < ActionController::Base
  # Logged to console when someone requests API with invalid format
  INVALID_MIME_FORMAT = "Requested MIME format not acceptable for this API"

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

  protected

  def accept_json
    unless params[:format] == "json" || request.headers["Accept"] =~ /json/
      logger.error INVALID_MIME_FORMAT
      head :not_acceptable
    end
  end

  def accept_html
    unless params[:format] == "html" || request.headers["Accept"] =~ /html/
      logger.error INVALID_MIME_FORMAT
      head :not_acceptable
    end
  end
end
