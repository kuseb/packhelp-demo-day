module API
  class AccessDenied < StandardError
  class ApiController < ActionController::Base
    before_action :authenticate_user!

    rescue_from AccessDenied do |exception|
      respond_to do |format|
          format.json { head :forbidden }
          format.html { head :forbidden }
      end
    end
  end
end
