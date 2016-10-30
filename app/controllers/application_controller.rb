class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  include SessionsHelper
end
