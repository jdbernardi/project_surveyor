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

MULTIPLIER = 5

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
			random_boolean = [ true, false ].sample
		# :multiple_allowed
			mc[:multiple_allowed] = random_boolean
		# :num_options
			mc[:num_options] = rand( 1..5 )
		# :survey_id
		  mc[:survey_id] = survey.id
		# :required
			mc[:required] = random_boolean
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

MULTIPLIER.times { generate_surveys }
generate_multiple_choice_questions
generate_options_for_mc
# create one without questions
generate_surveys

