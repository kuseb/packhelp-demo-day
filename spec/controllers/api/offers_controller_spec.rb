require 'rails_helper'

module API do
  describe OffersController, type: :controller do
    let(:client) { create :user, :client }
    let(:admin) { create :user, :admin }
  
    describe 'GET index' do
      subject { get :index, {}, auth_token }
      let(:auth_token) { admin.create_new_auth_token }
      
      before :each do
        client2 = create :user, :client
        create_list :offer, 3, user: client
        create_list :offer, 2, user: client2
      end

      it 'assigns all offers as @offers' do
        subject
        expect(assigns(:offers).size).to eq(5)
      end
    end

    describe 'GET show' do
      subject { get :show, { id: offer.id }, auth_token }

      context 'when offer has appropriate client' do
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client.create_new_auth_token }
    
        it 'assigns the requested offer as @offer' do
          subject
          expect(assigns(:offer)).to eq(offer)
        end
      end

      context 'when offer does not belong to appropriate client' do
        let(:client2) { create :user, :client }
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client2.create_new_auth_token }

        it 'raises AccessDenied exception' do
          expect{ subject }.to raise_error API::AccessDenied
        end
      end
    end

    describe 'POST accept' do
      subject { post :accept, { id: offer.to_param }, auth_token }

      context 'when offer has appropriate client' do
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client.create_new_auth_token }
    
        it 'returns 200' do
          subject
          
          expect { subject }
        end
      end

      context 'when offer does not belong to appropriate client' do
        let(:client2) { create :user, :client }
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client2.create_new_auth_token }

        it 'raises AccessDenied exception' do
          expect{ subject }.to raise_error API::AccessDenied
        end
      end
    end

    describe 'POST reject' do
      subject { post :accept, { id: offer.to_param }, auth_token }

      context 'when offer has appropriate client' do
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client.create_new_auth_token }
    
        it 'returns 200' do
          subject
          expect { subject }
        end
      end

      context 'when offer does not belong to appropriate client' do
        let(:client2) { create :user, :client }
        let(:offer) { create :offer, user: client }
        let(:auth_token) { client2.create_new_auth_token }

        it 'raises AccessDenied exception' do
          expect{ subject }.to raise_error API::AccessDenied
        end
      end
    end

    describe 'POST create' do
    end
  end
end