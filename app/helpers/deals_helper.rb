module DealsHelper
	def is_activity_active(deal, date = Date.today)
		return false unless deal.activity_active == true
		if deal.activity_type == 'followup' && (deal.activity_date > date || [2,4].include?(deal.followups.last.try(:follow_up_task_count)))
			return false
		elsif deal.activity_type == 'renewal' && deal.activity_date > date + 3.months
			return false
		end
		return true
	end
end
