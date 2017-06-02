class VacancyAssignMailer < ApplicationMailer

  def contact_message(agency_email, user_email, user_name, message)
    @user_name = user_name
    @user_email = user_email
    @message = message
    mail(to: agency_email, subject: 'Contact form on RealEstate')
  end
end
