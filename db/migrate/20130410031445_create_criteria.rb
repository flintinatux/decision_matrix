class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.string :name
      t.integer :weight
      t.integer :decision_id

      t.timestamps
    end
  end
end
