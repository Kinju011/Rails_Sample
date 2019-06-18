class CreateSubscribtions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribtions do |t|
      t.references :User, foreign_key: true
      t.references :Book, foreign_key: true

      t.timestamps
    end
  end
end
