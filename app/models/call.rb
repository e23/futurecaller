class Call < ActiveRecord::Base
  attr_accessible :caller_id, :num_to_call, :text_to_say, :time_to_call, :voice_id
end
