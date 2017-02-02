class QuestionTypesController < ApplicationController


	def index

		if Survey.find(params[:survey_id])
			@survey = Survey.find( params[:survey_id])
			@mcs = @survey.multiple_choice_questions
			@rqs = @survey.range_questions
		else
			@surveys = Survey.all
		end

	end


	def select_mc_or_range

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
