class ContactMailer < ApplicationMailer
  def send_message(contact_id)
    @contact = Contact.find(contact_id)
    mail(
      from: 'gustavo@nufiu.com.br',
      to: 'malu@nufiu.com.br',
      subject: "nufiu.com.br: #{@contact.subject}"
    )
  end
end
