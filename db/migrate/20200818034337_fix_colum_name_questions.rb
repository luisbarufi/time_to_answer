class FixColumNameQuestions < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :desription, :description
  end
end
