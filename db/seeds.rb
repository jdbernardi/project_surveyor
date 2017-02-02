# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Survey.destroy_all
MultipleChoiceQuestion.destroy_all
Option.destroy_all
Answer.destroy_all

MULTIPLIER = 20

# generate_surveys
def generate_surveys
	# :title
	survey = Survey.new
	survey[:title] = Faker::Lorem.sentence
	# :description
	survey[:description] = Faker::Lorem.sentence
	survey.save

end

# generate MultipleChoiceQuestions
def generate_multiple_choice_questions
	# :text
	Survey.all.each do | survey |

		rand(3..6).times do
			mc = MultipleChoiceQuestion.new
		# :multiple_allowed
			mc[:multiple_allowed] = [ true, false ].sample
		# :num_options
			mc[:num_options] = rand( 1..5 )
		# :survey_id
		  mc[:survey_id] = survey.id
		# :required
			mc[:required] = [ true, false ].sample
		# :text
			mc[:text] = Faker::Lorem.sentence

			mc.save

		end

	end

end


# generate options
def generate_options_for_mc

	MultipleChoiceQuestion.all.each do | mc |

		mc[:num_options].times do

			option = Option.new
	# :question_id
			option[:question_id] = mc.id
	# :option_text
			option[:option_text] = Faker::Lorem.sentence
	# :question_type (class)
			option[:question_type] = "MultipleChoiceQuestion"

			option.save

		end
	end
end


def generate_responses

	survey = Survey.all.sample

	survey.multiple_choice_questions.each do | mc |

		if mc.multiple_allowed


			ids_options = mc.options.ids

			rand(1..mc.num_options).times do

				num = ids_options.delete ids_options.sample

				option = Option.find( num )
				answer = option.answers.build
				answer.save

			end

		else

			ids_options  = mc.options.ids

			option = Option.find( ids_options.sample )
			answer = option.answers.build
			answer.save


		end

	end

end


10.times { generate_surveys }
generate_multiple_choice_questions
generate_options_for_mc
# create one without questions
MULTIPLIER.times { generate_responses }


