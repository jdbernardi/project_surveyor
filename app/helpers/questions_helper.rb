module QuestionsHelper


	def question_type( number )

		if number == '1'

			return MultipleChoiceQuestion.new

		elsif number == '2'

			return RangeQuestion.new

		end

	end



end
