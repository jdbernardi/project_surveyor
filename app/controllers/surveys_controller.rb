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

			redirect_to new_survey_question_path(@survey.id )

		else

			flash.now[:error] = "Failed to create survey!"
			render :new

		end

	end


def update

byebug

end


end



private

  def whitelisted_survey_params
byebug
    params.require(:survey).permit( :title,
              :description )
  end