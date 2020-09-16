class AddLocaleSupport < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :locale, :string
    add_column :users, :time_zone, :string
  end
end
