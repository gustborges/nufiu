class ContactMailer < ApplicationMailer
  def send_message(contact)
    @contact = contact
    mail(
      from: 'gustavo@nufiu.com.br',
      to: 'malu@nufiu.com.br',
      subject: "nufiu.com.br: #{@contact.subject}"
    )
  end
end
