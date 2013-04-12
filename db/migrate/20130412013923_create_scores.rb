class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value
      t.integer :choice_id
      t.integer :criterion_id

      t.timestamps
    end
  end
end
