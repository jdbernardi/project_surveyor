module QuestionsHelper


	def question_type( number )

		if number == '1'

			return MultipleChoiceQuestion.new

		elsif number == '2'

			return RangeQuestion.new

		end

	end




	def save_multiple_allowed_to_question

		if params['multiple'] == 'true'

			@question_type.update( multiple_allowed: true )

		end

	end




	def assign_type_to_question

		if @question_type.class.name == 'MultipleChoiceQuestion'

			@question.question_type = 'mc'

		elsif @question_type.class.name == 'RangeQuestion'

			@question.question_type == 'range'

		end

	end


	def pull_question_type

		if @question.question_type = 'mc'

			return MultipleChoiceQuestion.find( params["question_type_id"])

		elsif @question.question_type = 'range'

			return RangeQuestion.find( params["question_type_id"])

		end

	end

end
