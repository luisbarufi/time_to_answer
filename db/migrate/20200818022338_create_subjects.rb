class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :desription, null: false

      t.timestamps
    end
  end
end
