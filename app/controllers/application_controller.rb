class ApplicationController < ActionController::Base
  protect_from_forgery
  #Need SessionHelper methods not only in views but also in controllers...
  include SessionsHelper
end
