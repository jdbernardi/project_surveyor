class MultipleChoiceQuestionsController < ApplicationController

	def new

		@survey = Survey.find(params[:survey_id])
		@mc_question = @survey.multiple_choice_questions.build


	end

	def new_options

		@question = MultipleChoiceQuestion.find( params[:question_id] )
		@options = []

		@question.num_options.times do |x|

			@options << @question.options.build

		end

	end


	def create

		@survey = Survey.find( params[:survey_id])
		@mc_question = @survey.multiple_choice_questions.build( mc_params )

		if @mc_question.save

			redirect_to new_options_path(:question_id => @mc_question.id)

		else

			render :new

		end

	end



	def update

		@question = MultipleChoiceQuestion.find( params[:id])

		if @question.update( mc_options )

			redirect_to question_types_path(:survey_id => @question.survey_id )

		else

			flash[:notice] = "Unable to save"

			render :new

		end


	end


	def destroy

		@mc = MultipleChoiceQuestion.find( params[:id] )
		@survey_id = @mc.survey_id

    if @mc.destroy

        flash[:success] = "Question deleted! Boom!"

        redirect_to question_types_path( :survey_id => @survey_id )
    else

    	flash[:notice] = "Question unable to delete!"

    	render :new

    end


	end

end





private


	def mc_params

		params.require(:multiple_choice_question).permit(:num_options, :multiple_allowed, :survey_id, :required)

	end

	def mc_options

		params.require('multiple_choice_question').
			permit(:id,
						 :text,
						 { :options_attributes => [
						 	 :option_text
						 	] } )

	end