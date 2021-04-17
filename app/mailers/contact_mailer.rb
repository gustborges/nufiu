class ContactMailer < ApplicationMailer
  def send_message(contact)
    @contact = contact
    mail(
      from: @contact.email,
      to: 'maria@nufiu.com.br',
      subject: "nufiu.com.br: #{@contact.subject}"
    )
  end
end
