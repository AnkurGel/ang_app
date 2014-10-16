module ApplicationHelper

	def deal_active_class(stage)
		klass =  stage.downcase #deal_stage_color(stage)
		return klass unless current_page?(controller: 'deals', action: 'index')
		if (stage == 'all' && params[:stage] == nil) || (params[:stage].present? && params[:stage] == stage.downcase)
			klass = klass + ' active'
		end
		klass
	end

	def deal_stage_color(stage)
		stage_index = STAGES.index(stage.try(:upcase))
		klass = stage_index.present? ? STAGE_COLORS[stage_index] : ''
	end

	def active_page?(controller, action)
		current_page?(controller: controller, action: action)
	end

	def any_active_page?(paramArr)
		paramArr.any?{ |p| current_page?(controller: p[0], action: p[1]) }
	end

	def capitalize_words(_string)
		_string.sub(/^(\w)/) {|s| s.capitalize} if _string.is_a?(String)
	end

end
