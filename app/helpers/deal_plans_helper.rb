module DealPlansHelper

	def get_plan(plans, product)
		plans.select {|d| d.product == product}.first
	end

	def deal_product_text(product)
		if product == 'live'
			'Live Testing'
		elsif product == 'screenshot'
			'Screenshot'
		elsif product == 'automate'
			'Automate'
		end
	end

	# def plan_has_product?(plans, product)
	# 	get_plan(plans, product).present?
	# end

	def plan_stage(plans, product)
		stage = get_plan(plans, product).try(:plan_stage)
		if stage == 'interested'
			'interested in'
		elsif stage == 'purchased'
			'purchased'
		end
	end

	def icon_for_product(product)
		product == 'live' ? 'desktop' : (product == 'screenshots' ? 'copy' : 'settings')
	end

end
