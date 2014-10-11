class Deal < ActiveRecord::Base
  PAYMENT_TYPE = {'activated_through_wire' => 'Wire Transfer',
                  'activated_through_reseller_cc' => 'Reseller',
                  'approved' => 'Credit Card' }

  scope :active_deals, -> { where(closed_date: nil).order(id: :desc) }
  scope :active_deal, -> { where(closed_date: nil).limit(1) } #called by customer.rb
  scope :inactive_deals, -> { where('closed_date is not null') }

  belongs_to :customer
  belongs_to :reseller, :class_name => 'Customer', :foreign_key => 'reseller_id'

  before_save { |deal| deal.stage = deal.stage.try(:downcase) }
  after_save :remove_close_fields, if: Proc.new { |deal| ['won', 'lost'].exclude?(deal.stage) && self.closed_date.present? }

  def remove_close_fields
    self.closed_date = nil
    self.deal_close_reason = nil
    self.save
  end
end
