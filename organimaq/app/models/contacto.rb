class Contacto < MailForm::Base
	attribute :nombre,      :validate => true
	attribute :email
  attribute :mensaje
  attribute :nickname,  :captcha  => true

# Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Formulario contacto",
      :to => "cristian15002002@gmail.com",
      :from => %("#{nombre}" <#{email}>)
    }
  end
end