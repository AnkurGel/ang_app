class Customer < ActiveRecord::Base
	has_many 		:deals
	has_one 		:active_deal, -> { active_deal }, class_name: 'Deal'

  def discounted?
    self.discount == true
  end

  def is_reseller?
    self.kind == 'reseller'
  end

end
