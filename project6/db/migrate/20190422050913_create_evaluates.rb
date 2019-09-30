class CreateEvaluates < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluates do |t|
      t.boolean :attempt
      t.integer :user_id
      t.integer :ratee_id
      t.integer :group_id

      t.timestamps
    end
  end
end
