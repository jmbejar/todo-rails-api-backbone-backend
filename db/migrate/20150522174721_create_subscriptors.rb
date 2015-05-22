class CreateSubscriptors < ActiveRecord::Migration
  def change
    create_table :subscriptors do |t|
      t.string :email

      t.timestamps
    end
  end
end
