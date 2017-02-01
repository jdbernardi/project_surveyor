class AnswersController < ApplicationController

	include AnswersHelper

	def create

		radio_responses = params[:option]

		create_answers( radio_responses )

	end


end


private


def white_list_params

	#permitting radio_mc_op????
	params.permit( [:radio_mc_op => {} , :checkbox_op_ids => [] ], :survey_id)

end
=begin
<ActionController::Parameters {"utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"o939wheZdqWdL6CEsvGEQ8MA7/Bp97l+qfG/llmj2VKOehAj3FRptvNu99t3mTUsFYuYikaSsjxvPmzSwhIz4Q==", "radio_mc_op"=><ActionController::Parameters {"241"=>"327", "242"=>"329"} permitted: true>, "checkbox_op_ids"=>["330", "337", "338"], "commit"=>"Finish Survey", "survey_id"=>"230", "controller"=>"answers", "action"=>"create"} permitted: true>
=end
