module API
  class OffersController < ApiController
    before_action :set_offer, only: [show, accept, reject]
    
    def index
      raise AccessDenied unless current_user.agent?
      @offers = Offer.all
      render @offers, content_type: 'application/json'
    end

    def show
      raise AccessDenied unless current_user.client? && @offer.user == current_user
      render @offer, content_type: 'application/json'
    end

    def accept
      if @offer.update(status: 'accepted')
        render status: 200
      else
        render status: 500
    end

    def reject
      if @offer.update(status: 'rejected')
        render status: 200
      else
        render status: 500
    end

    private

    def set_offer
      @offer = Offer.find(params[:id])
    end
  end
end