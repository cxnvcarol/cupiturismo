class UserMailer < ActionMailer::Base
  default from: "cxnvcarol@outlook.com"

  def contact(user,subj,msg)
    @user = user
    @url  = 'http://example.com/login'
    #mail(to: user, subject: 'subj', message:msg)
    mail(to: user, subject: subj, body: msg, content_type: "text/html")
  end
end
