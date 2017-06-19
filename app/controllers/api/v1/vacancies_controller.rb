class Api::V1::VacanciesController < ApplicationController
  include Docs::Api::V1::VacanciesController

  before_action :find_vacancy, only: [:show, :update, :destroy]

  def index
    @vacancies = []
    if params[:page].present? && params[:per].present?
      @vacancies = Vacancy.order(:id).reverse_order.page(params[:page].to_i).per(params[:per].to_i)
    else
      @vacancies = Vacancy.order(:id).reverse_order
    end
    render json: @vacancies, status: 200
  end

  def show
    render json: @vacancy, status: 200
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      render json: @vacancy, status: 201
    else
      render json: @vacancy.errors, status: 422
    end
  end

  def update
    if @vacancy.update(vacancy_params)
      render json: @vacancy, status: 200
    else
      render json: @vacancy.errors, status: 422
    end
  end

  def destroy
    @vacancy.destroy
    render json: {}, status: 200
  end

  private

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title,
                                    :category,
                                    :email,
                                    :city,
                                    :street,
                                    :job_type,
                                    :active_to_date,
                                    :type,
                                    :description,
                                    :company,
                                    { tags: [] },
                                    :price_per_hour,
                                    :website)
  end
end
