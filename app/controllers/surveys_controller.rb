class SurveysController < ApplicationController

	def index

		@surveys = Survey.all


	end

	def new

		@survey = Survey.new

	end

	def create

		@survey = Survey.new( whitelisted_survey_params )

		if @survey.save

			flash[:success] = "created survey"

			redirect_to question_types_path( :survey_id => @survey.id )

			#explicitly named route

		else

			flash.now[:error] = "Failed to create survey!"
			render :new

		end

	end

	def take

		@survey = Survey.find( params[ :id ] )
		@mcs = @survey.multiple_choice_questions

	end


	def update
byebug
		@survey = Survey.find( params[:id] )

	end


end





private

  def whitelisted_survey_params

    params.require(:survey).permit( :title,
              :description )
  end