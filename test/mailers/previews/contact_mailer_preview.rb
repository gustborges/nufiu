# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def send_message
    contact = Contact.first
    ContactMailer.send_message(contact)
  end

end
