module CommunicationsHelper
	def is_support_email?(email)
		email.present? && email.match(/support(\+\d)*@browserstack.com/).present?
	end

	def is_browserstack_email?(email)
		email.present? && email.match(/@browserstack.com/).present?
	end

	def email_from_display(communication)
		email = communication.from
		if is_browserstack_email?(communication.from) || !communication.from.present?
			user = communication.agent || 'BrowserStack Support'
			email = 'support@browserstack.com' unless email
		else
			user = communication.user.name.titleize if communication.user.present?
		end
		"#{user} <small class='ui grey content'>&lt;#{email.downcase}&gt;</small>".html_safe
	end

	def communication_info(communication)
		result = date_display(communication.created_at)
		result << " by #{communication.agent} " if is_support_email?(communication.from)
		result << " [case: #{communication.case_id}] " if communication.case_id.present?
		result
	end

	def multi_email_display(comm)
		comms = comm.map do |e|
			"#{e[:full_name]} <small class='ui grey content'>&lt;#{e[:email].downcase}&gt;</small>" #unless is_support_email?(e[:email])
		end
		comms.compact.join(',<br/> ').html_safe
	end

	def get_case_desk_url(case_id)
		"https://bstack.desk.com/agent/case/#{case_id}"
	end
end
