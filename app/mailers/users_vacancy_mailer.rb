class UsersVacancyMailer < ApplicationMailer
  def apply_for_vacancy(from: nil, to: nil, full_name: nil, description: nil)
    @url  = 'http://example.com/login'
    mail(to: to, from: from, subject: 'Applying for your vacancy', description: description)
  end
end
