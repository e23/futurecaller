require 'date'

class CallsController < ApplicationController
  def index
  	@call = Call.new
  end

  def create
  	@call = Call.new
  	@call.num_to_call = params[:call][:num_to_call]
  	@call.caller_id = params[:call][:caller_id]
  	@call.text_to_say = params[:call][:text_to_say]
    @call.time_to_call = setdateformat(params[:time_to_call])
     

  	if @call.save
  		render 'success'
  	else
  		render 'index'
  	end
  end

  def success
  	
  end

  private

    def setdateformat(thetime)
      date_param = thetime
      if date_param['month'].length == 1
        date_param['month'] = "0#{date_param['month']}"
      end
      if date_param['day'].length == 1
        date_param['day'] = "0#{date_param['day']}"
      end
      date_format = "#{date_param['month']}/#{date_param['day']}/#{date_param['year']}"
      time_format = "#{date_param['hour']}:#{date_param['minute']}"
      return "#{date_format} - #{time_format}"
    end
end
