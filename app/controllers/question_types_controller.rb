class QuestionTypesController < ApplicationController


	def index

    @survey = Survey.find(params[:survey_id])


	end


	def select
byebug
		@survey = Survey.find( params[:survey_id] )

		if params[:question_type] = 'mc'

			redirect_to new_multiple_choice_question_path( :survey_id => @survey.id )

		elsif params[:question_type] = 'range'

			redirect_to new_range_path( :survey_id => @survey.id )

		else

			flash[:error] = 'does not compute!'

			render :new

		end


	end




private

	def question_params

		params.permit(:question_type, :required)

	end


	def mc_params

		params.permit(:multiple_allowed)

	end


	def white_list_params

		params.permit(:survey_id, :question_type)

	end


end
	   #params.require(:survey).permit( :title, :description )