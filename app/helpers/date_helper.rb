module DateHelper

	#used by followup.rake
	def calc_followup_days(no_days) #takes real days
		today = Date.today
		followup_day = (today + no_days.day).wday
		new_no_days = no_days + ((1..5).include?(followup_day) ? 0 : (followup_day+1)%5 )
		followup_date = today + new_no_days.day
		res = { actual_days: new_no_days, business_days: today.business_days_until(followup_date),
			followup_date: followup_date, follow_no: FOLLOW_NO[new_no_days] }
	end

	def calc_followup_day(no_days, no) #takes business days
		today = Date.today
		followup_date = no_days.business_day.after(today)
		actual_days = (followup_date.to_date - today).to_i
		res = { actual_days: actual_days, business_days: no_days,
			followup_date: followup_date, follow_no: no }
	end

	def show_days_if_diff(m, n)
		m != n ? " #{m}d" : nil
	end

	def date_display(date)
		date.in_time_zone('Kolkata').strftime("%d %b %y") if date
		#date.strftime("%B %d %y at %I:%M %p")
	end

	def display_followup_days(n)
		BUSINESS_DAY_MAP[n].present? ? BUSINESS_DAY_MAP[n] : pluralize(n, 'day')
	end

	# def diff_days(date)
	# 	((date - today).days/1.day).to_i
	# end


	# def add_real_working_days(n)
	# 	work_days = get_working_days_for_next(n)
	# 	work_days != n ? work_days : 0
	# end

	# def show_diff_working_days(n)
	# 	work_days = get_working_days_for_next(n)
	# 	work_days != n ? " #{work_days}d" : nil
	# end

	# protected
	# def get_working_days_for_next(n)
	# 	only_weekdays_size(today..(today + n - 1))
	# end

 #  def only_weekdays_size(range)
 #    range.select { |d| (1..5).include?(d.wday) }.size
 #  end

end