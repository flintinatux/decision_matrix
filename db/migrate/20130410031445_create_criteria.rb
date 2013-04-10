class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
  end
end
