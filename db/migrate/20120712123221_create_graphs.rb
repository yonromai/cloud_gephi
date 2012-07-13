class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.integer :user_id
      t.string :source
      t.string :description
      t.string :image

      t.timestamps
    end
    add_index :graphs, [:user_id, :created_at]
  end
end
