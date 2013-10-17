class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include SubsHelper
  include LinksHelper
end
