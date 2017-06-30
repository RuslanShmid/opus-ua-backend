class UsersVacancyMailer < ApplicationMailer
  def apply_for_vacancy(from: nil, to: nil, full_name: nil, email: nil, description: nil, filename: nil, content_type: nil, file_contents: nil)
    attachments[filename] = {
      :mime_type => content_type,
      :content => file_contents } if filename
    mail(to: to, from: from, subject: "#{full_name} is applying for your vacancy") do |format|
      format.html {
        render locals: { description: description,
                         email: email }
      }
    end
  end
end
