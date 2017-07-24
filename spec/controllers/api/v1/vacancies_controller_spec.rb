require 'rails_helper'

RSpec.describe Api::V1::VacanciesController, type: :controller do

  context 'SIGNED IN' do
    sign_in_as_user
    let(:valid_vacancy_params) { FactoryGirl.attributes_for :vacancy }
    let(:invalid_vacancy_params) { FactoryGirl.attributes_for :vacancy, email: '234' }
    let!(:vacancy) { FactoryGirl.create :vacancy, user: current_user }
    describe 'GET #index' do
      context 'WITH VALID PARAMS' do
        it 'responds with status 200' do
          process :index, method: :get, params: {}
          expect(response.status).to eq 200
        end

        it 'return users vacancy' do
          process :index, method: :get, params: { user_id: current_user.id}
          expect(response.body).to eq(response.body)
        end
      end
    end
    describe 'POST #create' do
      context 'WITH VALID PARAMS' do
        it 'responds successfully with an HTTP 201 status code' do
          process :create, method: :post, params: { vacancy: valid_vacancy_params }
          expect(response.status).to eq(201)
        end

        it 'responds successfully with an HTTP 201 status code' do
          process :create, method: :post, params: { vacancy: valid_vacancy_params }
          expect(assigns(:vacancy)).to be_a(Vacancy)
        end

        it 'created new vacancy' do
          expect do
            process :create, method: :post, params: { vacancy: valid_vacancy_params }
          end.to change(Vacancy, :count).by(1)
        end
      end

      context 'WITH INVALID PARAMS' do
        let(:invalid_vacancy_params) { FactoryGirl.attributes_for :vacancy, email: '324rwfd\'dfsdfds' }
        it 'responds with 422' do
          process :create, method: :post, params: { vacancy: invalid_vacancy_params }
          expect(response.status).to eq 422
        end

        it 'vacancy count does not changes' do
          expect do
            process :create, method: :post, params: { vacancy: invalid_vacancy_params }
          end.to change(Vacancy, :count).by(0)
        end
      end
    end

    describe 'PUT #update' do
      context 'WITH VALID PARAMS' do
        it 'responds successfully with an HTTP 200 status code' do
          process :update, method: :put, params: { id: vacancy.id, vacancy: valid_vacancy_params }
          expect(response.status).to eq(200)
        end

        it 'object should be changed' do
          process :update, method: :put, params: { id: vacancy.id, vacancy: valid_vacancy_params }
          expect(Vacancy.find(vacancy.id).email).equal? valid_vacancy_params[:email]
        end

        it 'respond should be created object' do
          process :update, method: :put, params: { id: vacancy.id, vacancy: valid_vacancy_params }
          expect(assigns(:vacancy)).to be_a(Vacancy)
        end
      end

      context 'WITH INVALID PARAMS' do
        let(:invalid_vacancy_params) { FactoryGirl.attributes_for :vacancy, email: '324rwfd\'dfsdfds' }
        it 'responds with 422' do
          process :update, method: :put, params: { id: vacancy.id, vacancy: invalid_vacancy_params }
          expect(response.status).to eq 422
        end

        it 'object should not be changed' do
          process :update, method: :put, params: { id: vacancy.id, vacancy: invalid_vacancy_params }
          expect(Vacancy.find(vacancy.id).email).not_to eq invalid_vacancy_params[:email]
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'WITH VALID PARAMS' do
        it 'responds with an HTTP 200 status code' do
          process :destroy, method: :delete, params: { id: vacancy.id }
          expect(response.status).to eq(200)
        end

        it 'destroys the requested vacancy' do
          expect do
            delete :destroy, params: { id: vacancy.id }
          end.to change(Vacancy, :count).by(-1)
        end
      end
    end
  end

  describe 'SIGNED OUT' do
    describe 'GET #index' do
      context 'WITH VALID PARAMS' do
      end
      context 'WITH INVALID PARAMS' do
      end
    end
    describe 'POST #create' do
      context 'WITH VALID PARAMS' do
      end
      context 'WITH INVALID PARAMS' do
      end
    end
    describe 'PUT #update' do
      context 'WITH VALID PARAMS' do
      end
      context 'WITH INVALID PARAMS' do
      end
    end
    describe 'DELETE #destroy' do
      context 'WITH VALID PARAMS' do
      end
      context 'WITH INVALID PARAMS' do
      end
    end
  end
end
