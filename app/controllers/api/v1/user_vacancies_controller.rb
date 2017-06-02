class Api::V1::UserVacanciesController < ApplicationController
  before_action :find_user_vacancy, only: %i(show destroy)

  def index
    VacancyAssignMailer.contact_message('someEmail',
                                        'shmid9615@gmail.com',
                                        'Shmid',
                                        'wqeqw eqw eqw ewq eqwe qw').deliver_now
    # @user_vacancy = UserVacancy.find(params[:vacancy_id]).users
    # render json: @user_vacancy, status: 200
  end

  def show
    authorize @user_vacancy
    render json: @user_vacancy, status: 200
  end

  def create
    @user_vacancy = UserVacancy.new(user_vacancy_params)
    if @user_vacancy.save
      render json: @user_vacancy, status: 201
    else
      render json: @user_vacancy.errors, status: 422
    end
  end

  def destroy
    authorize @user_vacancy
    @user_vacancy.destroy
    render json: {}, status: 200
  end

  private

  def find_user_vacancy
    @user_vacancy = UserVacancy.find(params[:id])
  end

  def user_vacancy_params
    params.require(:user_vacancy).permit(:vacancy_id, :user_id)
  end
end