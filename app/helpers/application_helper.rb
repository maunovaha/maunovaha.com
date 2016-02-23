module ApplicationHelper
  def base_url
    "http://#{Rails.env.production? ? 'maunovaha.com' : 'localhost:3000'}"
  end
end
