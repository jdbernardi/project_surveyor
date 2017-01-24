class Option < ApplicationRecord


	belongs_to :question, :polymorphic => true


	belongs_to :survey


end


