module UsersHelper
	def user_details(user)
		user.email
	end

	def automate_dashboard_url(user)
		"http://browserstack.com/automate?user_id=#{user.bs_user_id}"
	end

	def user_stats_url(user)
		"http://browserstack.com/admin/user_stats?q=#{user.bs_user_id}&column_selected=ID"
	end
end
