class ContactMailer < ActionMailer::Base
  default from: 'contacto@krt.cl'
  layout 'mailer'

  def first_steps(contact)
    @contact = contact
    @name = contact.first_name
    @last_name = contact.last_name
    mail(to: @contact.email, subject: "Primeros pasos - KRT Driver")
  end
end
