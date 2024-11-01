class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  # Since we're using API mode

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
