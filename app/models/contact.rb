class Contact < MailForm::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	attributes :name, :validate => true,
		:length => { :maximum => 50}
        attributes :email, :validate => true,
		:length => { :maximum => 255 },
		:format => VALID_EMAIL_REGEX,
		:uniqueness => true,
		:case_sensitive => false
	attributes :message, :validate => true

	def headers
		{
			:subject => "Contact Form",
			:to => "kohrVid@gmail.com",
			:from => %("#{name}" <#{email}>)
		}
	end
end
