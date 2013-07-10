class CallsController < ApplicationController
  def index
  	@call = Call.new
  end

  def create
  	@call = Call.new
  	@call.num_to_call = params[:call][:num_to_call]
  	@call.caller_id = params[:call][:caller_id]
  	@call.text_to_say = params[:call][:text_to_say]
  	@call.time_to_call = ""
  	params[:time_to_call].each do |key,value|
  		@call.time_to_call << "#{value}"
  		if key != "minute"
  			@call.time_to_call << ":"
  		end	
  	end


  	if @call.save
  		render 'success'
  	else
  		render 'index'
  	end
  end

  def success
  	
  end
end
