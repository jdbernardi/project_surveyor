module QuestionsHelper


	def question_type( number )

		if number == '1'

			return MultipleChoiceQuestion.new

		elsif number == '2'

			return RangeQuestion.new

		end

	end


	def assign_question_id_to_type
		#question ID to be stored in Question type
		@question_type.question_id = @question.id

	end

end
