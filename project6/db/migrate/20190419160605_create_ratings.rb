class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
    
    t.integer :evaluate_id
    t.integer :user_id
    t.integer :group_id
    t.float :score
    t.string :comments
    t.datetime :created_at
    t.datetime :updated_at
      t.timestamps
     end
  end
end

