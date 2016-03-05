class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from PUndit::NotAuthroizedError do |exception|
  	redirect_to root_url, alert: excetion.message
  end
end
