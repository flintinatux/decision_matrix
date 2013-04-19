class AddIndexes < ActiveRecord::Migration
  def change
    add_index :choices,  :decision_id
    add_index :criteria, :decision_id
    add_index :scores,   :choice_id
    add_index :scores,   :criterion_id
  end
end
