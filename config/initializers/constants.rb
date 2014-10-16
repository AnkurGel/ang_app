#ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base, :access_key_id => CONFIG['aws']['access_key_id'], :secret_access_key => CONFIG['aws']['secret_access_key']

#SES_MAILER = AWS::SES::Base.new(:access_key_id => CONFIG['aws']['access_key_id'], :secret_access_key => CONFIG['aws']['secret_access_key'])

STAGES = ['NEW', 'ONBOARDING', 'APPROVAL', 'PAYMENT', 'WON', 'LOST']
STAGE_COLORS = ['blue' ,'teal', 'purple', 'orange', 'green', 'red']
STAGE_TEXT = {
	'NEW' => 'NEW',
	'ONBOARDING' => 'ONBOARDING',
	'APPROVAL' => 'APPROVAL & SECURITY',
	'PAYMENT' => 'PAYMENT & LEGAL',
	'WON' => 'WON',
	'LOST' =>'LOST'
}

FOLLOWUP = [2, 3, 5, 5, 10]
DAY_MAP = {
	7 => '1 Week',
	14 => '2 Weeks',
	21 => '3 Weeks',
	30 => '1 Month',
	31 => '1 Month'
}
BUSINESS_DAY_MAP = {
	5 => '1 week',
	10 => '2 weeks'
}
LIVE_PLANS = ['Live', 'Lite', 'Solo', 'Team', 'Team Plus', 'Enterprise', 'Enterprise Plus']
AUTOMATE_PLANS = ['Automate', 'Lite', 'Basic', 'Rapid', 'Rapid Plus', 'Enterprise', 'Enterprise Plus']
SCREENSHOT_PLANS = ['Screenshots', 'Lite', 'Solo', 'Team', 'Team Plus', 'Enterprise', 'Enterprise Plus']
NOTIFICATION_EMAIL = "Notifications<alert@browserstack.com>"

LOST_REASONS = ['No Reply', 'Security', 'Change in Pricing', 'Lost Interest', 'Custom Installation', 'Performance & Speed',
	'Lost to Competitor', 'Product']

DEAL_TYPE = ['NEW', 'RENEWAL', 'UPGRADE', 'MORE']
