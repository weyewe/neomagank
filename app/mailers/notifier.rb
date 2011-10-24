class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # def signup_notification(user)
  #   recipients "#{user.name} <#{user.email}>"
  #   from       "My Forum "
  #   subject    "Please activate your new account"
  #   sent_on    Time.now
  #   body       { :user => user, :url => activate_url(user.activation_code, :host => user.site.host }
  # end
  
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => ["w.yunnal@gmail.com"], 
    :subject => "#{@user.email} baru join")
  end
  
  


end
