class Call < ActiveRecord::Base
  attr_accessible :caller_id, :num_to_call, :text_to_say, :time_to_call, :voice_id
  before_validation :scrub_num, only: [:caller_id, :num_to_call]

  validates :caller_id, presence: true, length: {is: 10}
  validates :num_to_call, presence: true, length: {is: 10}
  validates :text_to_say, presence: true
  validates :time_to_call, presence: true
  validates :voice_id, presence: true 


  def scrub_num
  	self.caller_id = self.caller_id.gsub(/[^0-9]/i, '')
  	self.num_to_call = self.num_to_call.gsub(/[^0-9]/i, '')
  end
end
