class ConfirmMailer < ApplicationMailer
  def confirm_mail(picture)
    @picture = picture
    mail to: @picture.user.email, subject: "InstagramCloneに投稿されました"
  end
end
