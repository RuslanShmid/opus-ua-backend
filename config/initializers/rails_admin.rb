RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :admin
  end

  config.current_user_method do
    request.env["warden"].user
  end

  config.authorize_with do
    redirect_to main_app.root_path unless request.env["warden"].user.admin?
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
