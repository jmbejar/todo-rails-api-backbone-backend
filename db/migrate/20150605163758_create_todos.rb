class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed
      t.integer :order

      t.timestamps
    end
  end
end
