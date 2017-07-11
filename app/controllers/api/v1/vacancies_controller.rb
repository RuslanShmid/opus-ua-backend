class Api::V1::VacanciesController < ApplicationController
  include Docs::Api::V1::VacanciesController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    vacancies = vacancies_service.perform
    render json: vacancies, status: 200
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    render json: @vacancy, status: 200
  end

  def create
    @vacancy = current_user.vacancies.build(vacancy_params)
    if @vacancy.save
      render json: @vacancy, status: 201
    else
      render json: @vacancy.errors, status: 422
    end
  end

  def update
    @vacancy = current_user.vacancies.find(params[:id])
    if @vacancy.update(vacancy_params)
      render json: @vacancy, status: 200
    else
      render json: @vacancy.errors, status: 422
    end
  end

  def destroy
    @vacancy = current_user.vacancies.find(params[:id])
    @vacancy.destroy
    render json: {}, status: 200
  end

  private

  def vacancies_service
    @service ||= SearchVacanciesService.new(
      title: params[:title],
      category: params[:category],
      city: params[:city],
      page: params[:page],
      per: params[:per],
      job_type: params[:job_type],
      prMn: params[:prMn],
      prMx: params[:prMx],
      user: params[:user_id]
    )
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
