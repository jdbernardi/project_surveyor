class Option < ApplicationRecord


	belongs_to :question, :polymorphic => true

	has_many :answers, dependent: :destroy



end


