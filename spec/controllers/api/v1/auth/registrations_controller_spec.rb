require 'rails_helper'
RSpec.describe Api::V1::Auth::RegistrationsController, type: :controller do
  let(:valid_user_params) { FactoryGirl.attributes_for :user_sign_up }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'WITH VALID ATTRIBUTES' do
      before do |example|
        unless example.metadata[:skip_before]
          process :create, method: :post, params: { user: valid_user_params }
        end
      end

      it 'creates a new user', :skip_before do
        expect { post :create, params: { user: valid_user_params } }.to change { User.count }.by(1)
      end

      it 'responds with status 200' do
        expect(response.status).to eq(200)
      end

      it 'renders the json representation for the user record just created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to include {}
      end
    end

    context 'WITH INVALID ATTRIBUTE' do
      context 'of first_name' do
        let(:invalid_user_params) { FactoryGirl.attributes_for :user_sign_up, first_name: '$' }

        before(:each) do
          process :create, method: :post, params: { user: invalid_user_params }
        end

        it 'responds with status 422' do
          expect(response.status).to eq(422)
        end

        it 'renders an errors json' do
          user_response = JSON.parse(response.body, symbolize_names: true)
          expect(user_response).to have_key(:errors)
        end
      end

      context 'of email' do
        let(:invalid_user_params) { FactoryGirl.attributes_for :user_sign_up, email: '' }

        before(:each) do
          process :create, method: :post, params: { user: invalid_user_params }
        end

        it "renders with status 422" do
          expect(response.status).to eq(422)
        end

        it "renders the json errors on why the user could not be created" do
          user_response = JSON.parse(response.body, symbolize_names: true)
          expect(user_response[:errors][:email]).to include "can't be blank"
        end
      end
    end
  end
end
