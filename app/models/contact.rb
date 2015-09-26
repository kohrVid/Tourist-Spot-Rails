class Contact < MailForm::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	attributes :name, :presence => true,
		:length => { :maximum => 50}
        attributes :email, :presence => true,
		:length => { :maximum => 255 },
		:format => VALID_EMAIL_REGEX,
		:uniqueness => true,
		:case_sensitive => false
	attributes :message, :presence => true

	def headers
		{
			:subject => "Contact Form",
			:to => "kohrVid@gmail.com",
			:from => %("#{name}" <#{email}>)
		}
	end
end
