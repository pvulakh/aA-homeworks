class RenamePeopleTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :people_tables, :people
  end
end
