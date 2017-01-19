class QuestionTypesController < ApplicationController


	def index

    @survey = Survey.find(params[:survey_id])


	end


	def select

		@question = Question.new( white_list_params )
byebug
	end

end


private


	def white_list_params

		params.permit(:survey_id, :question_type)

	end


	   #params.require(:survey).permit( :title, :description )