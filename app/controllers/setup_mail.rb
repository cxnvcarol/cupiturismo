class ApplicationController < ActionController::Base
  protect_from_forgery
  ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
   :port                 => 3001,
  :domain               => "cupiturismo.com",
    :user_name            => "cupiturismo",
    :password             => "cupiturismo20",
      :authentication       => "plain",
      :enable_starttls_auto => true
  }
end
