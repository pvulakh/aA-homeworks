class CreatePeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people_tables do |t|
      t.string :name
      t.integer :house_id
    end
  end
end
