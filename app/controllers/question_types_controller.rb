class QuestionTypesController < ApplicationController


	def index

    @survey = Survey.find(params[:survey_id])


	end


	def select

		@survey = Survey.find( params[:survey_id] )

		if params[:question_type] = 'mc'

			redirect_to select_mc_options_path( :survey_id => @survey.id, :question_type => params[:question_type] )

		elsif params[:question_type] = 'range'

			redirect_to new_range_path( :survey_id => @survey.id )

		else

			flash[:error] = 'does not compute!'

			render :new

		end


	end


	def options
		@survey = Survey.find( params[:survey_id])
		byebug
		@question_type = params[:question_type]
byebug
	end


	def set_mc_options
byebug
		@survey = Survey.find( params[:survey_id] )
		@question = Question.create( question_params )
		@mc_child = MultipleChoiceQuestion.create( mc_params )

		@question.update(:survey_id => @survey.id )
		@mc_child.update(:question_id => @question.id)
byebug
		redirect_to new_question_path( :question_id => @question.id, :num_options => params[:num_options] )

	end

end

#<ActionController::Parameters {"utf8"=>"✓", "num_options"=>"3", "multiple"=>"true", "required"=>"true", "question_type"=>"mc", "commit"=>"CreateQuestions", "controller"=>"question_types", "action"=>"set_mc_options"} permitted: false>

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


	   #params.require(:survey).permit( :title, :description )