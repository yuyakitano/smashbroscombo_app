class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      subject: 'お問い合わせメッセージ受信',
      to: 'user@example.com',
      from: 'yuya@example.com'
    )
    #mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n

  end
end
