class FixColumNameSubjects < ActiveRecord::Migration[6.0]
  def change    
    rename_column :subjects, :desription, :description    
  end
end
