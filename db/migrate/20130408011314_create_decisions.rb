class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string :title
      t.string :notes

      t.timestamps
    end
  end
end
