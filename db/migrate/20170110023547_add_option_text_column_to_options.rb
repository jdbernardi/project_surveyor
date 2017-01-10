class AddOptionTextColumnToOptions < ActiveRecord::Migration[5.0]
  def change
  	add_column :options, :option_text, :string
  end
end
