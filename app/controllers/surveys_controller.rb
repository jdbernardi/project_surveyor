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

			redirect_to new_survey_question_path( @survey )

		else

			flash.now[:error] = "Failed to create survey!"
			render :new

		end

	end

	def show

		if Survey.find( params[:id] )

			@survey = Survey.find( params[:id] )
			@question = Question.new

		else

			flash.now[:error] = "Couldn't find survey"

			redirect_to surveys_path

		end



	end


	def update

		@survey = Survey.find( params[:id] )

	end


end



private

  def whitelisted_survey_params

    params.require(:survey).permit( :title,
              :description )
  end