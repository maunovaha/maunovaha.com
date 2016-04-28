module ApplicationHelper
  def base_url
    "http://#{Rails.env.production? ? 'www.maunovaha.com' : 'localhost:3000'}"
  end
end
