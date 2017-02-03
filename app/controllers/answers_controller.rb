class AnswersController < ApplicationController

	include AnswersHelper



	def create

		byebug

		@survey = Survey.find( params[:survey_id] )

		all_answers = pull_radio_ids( params[:option] ) + pull_checkbox_ids


		if required_questions_answered( all_answers )

			create_answers( all_answers )

			flash[:success] = "Thanks for taking the survey!"

			redirect_to surveys_path

		else

			flash[:error] = "Please answer required questions marked with *"

			redirect_to take_survey_path( @survey, :error => 'field_with_errors' )

		end


	end


	def show

		@survey = Survey.find( params[:survey_id] )

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
