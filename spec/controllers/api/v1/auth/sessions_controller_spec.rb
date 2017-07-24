require 'rails_helper'
RSpec.describe Api::V1::Auth::SessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:sign_in_error) { [I18n.t('devise_token_auth.sessions.bad_credentials')] }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'WITH VALID ATTRIBUTES' do
      it 'signs in user' do
        process :create, method: :post, params: { email: user.email, password: user.password }
        expect(subject.current_user).to eq(user)
      end

      it 'responds with status 200' do
        process :create, method: :post, params: { email: user.email, password: user.password }
        expect(response.status).to eq(200)
      end
    end

    context 'WITH INVALID ATTRIBUTES' do
      context 'credentials are bad' do
        it 'user is not signed in' do
          process :create, method: :post, params: { email: '', password: user.password }
          expect(subject.current_user).to eq(nil)
          expect(JSON.parse(response.body)["errors"]).to eq sign_in_error
        end

        it 'user is not signed in' do
          process :create, method: :post, params: { email: user.email, password: '111111111' }
          expect(JSON.parse(response.body)["errors"]).to eq sign_in_error
        end
        it 'responds with status 401' do
          process :create, method: :post, params: { email: '', password: '' }
          expect(response.status).to eq(401)
        end

        it 'renders error messages' do
          process :create, method: :post, params: { email: '', password: '' }
          expect(JSON.parse(response.body)["errors"]).to eq sign_in_error
        end
      end
    end
  end

  describe 'DELETE #destory' do
    before(:each) do
      process :create, method: :post, params: { email: user.email, password: user.password }

      @header = { "access-token" => response.header["access-token"],
                  "client" => response.header["client"],
                  "uid" => response.header["uid"] }
    end

    context 'with existing user' do
      it 'signs out user' do
        process :destroy, method: :delete, params: @header
        expect(response.status).to eq(200)
      end
    end
  end
end
