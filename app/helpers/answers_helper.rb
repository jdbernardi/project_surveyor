module AnswersHelper


	def create_answers_for_radio( responses )

		responses.each_pair do | k, v |
			# k = question_id, v = option_id
			option = Option.find( v )
			answer = option.answers.build
			byebug
			answer.save
			byebug
		end

	end


	def create_answers_for_checkboxes


	end


end
