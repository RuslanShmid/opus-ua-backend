require 'rails_helper'

RSpec.describe Api::V1::VacanciesController, type: :controller do
  let(:valid_vacancy_params) { FactoryGirl.attributes_for :vacancy }

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
      let(:invalid_vacancy_params) { FactoryGirl.attributes_for :vacancy, title: '324rwfd\'dfsdfds' }
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
    let!(:vacancy) { FactoryGirl.create(:vacancy) }
    context 'WITH VALID PARAMS' do
      it 'responds successfully with an HTTP 200 status code' do
        process :update, method: :put, params: { id: vacancy.to_param, vacancy: valid_vacancy_params }
        expect(response.status).to eq(200)
      end

      it 'object should be changed' do
        process :update, method: :put, params: { id: vacancy.to_param, vacancy: valid_vacancy_params }
        expect(Vacancy.find(vacancy.id).title).equal? valid_vacancy_params[:title]
      end

      it 'respond should be created object' do
        process :update, method: :put, params: { id: vacancy.to_param, vacancy: valid_vacancy_params }
        expect(assigns(:vacancy)).to be_a(Vacancy)
      end
    end

    context 'WITH INVALID PARAMS' do
      let(:invalid_vacancy_params) { FactoryGirl.attributes_for :vacancy, title: '324rwfd\'dfsdfds' }
      it 'responds with 422' do
        process :update, method: :put, params: { id: vacancy.to_param, vacancy: invalid_vacancy_params }
        expect(response.status).to eq 422
      end

      it 'object should not be changed' do
        process :update, method: :put, params: { id: vacancy.to_param, vacancy: invalid_vacancy_params }
        expect(Vacancy.find(vacancy.id).title).not_to eq invalid_vacancy_params[:title]
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'WITH VALID PARAMS' do
      let!(:vacancy) { FactoryGirl.create(:vacancy) }
      it 'responds with an HTTP 200 status code' do
        process :destroy, method: :delete, params: { id: vacancy.to_param }
        expect(response.status).to eq(200)
      end

      it 'destroys the requested vacancy' do
        expect do
          delete :destroy, params: { id: vacancy.to_param }
        end.to change(Vacancy, :count).by(-1)
      end
    end
  end
end
