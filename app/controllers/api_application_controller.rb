class ApiApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

end