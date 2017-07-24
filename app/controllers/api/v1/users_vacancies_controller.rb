class Api::V1::UsersVacanciesController < ApplicationController

  before_action :find_vacancy, only: [:show, :update, :destroy]

  def index

  end

  def create
    @users_vacancy = UsersVacancy.new(users_vacancy_params)
    if @users_vacancy.save
      UsersVacancyMailer.apply_for_vacancy(
        from: @users_vacancy.email,
        to: @users_vacancy.vacancy.email,
        full_name: @users_vacancy.full_name,
        email: @users_vacancy.email,
        description: @users_vacancy.description,
        filename: @users_vacancy.filename,
        content_type: @users_vacancy.content_type,
        file_contents: @users_vacancy.file_contents
      ).deliver
      render json: @users_vacancy, status: 201
    else
      render json: @users_vacancy.errors, status: 422
    end
  end

  private

  def users_vacancy_params
    params.require(:users_vacancy).permit(:vacancy_id,
                                          :email,
                                          :full_name,
                                          :description,
                                          :file)
  end
end
