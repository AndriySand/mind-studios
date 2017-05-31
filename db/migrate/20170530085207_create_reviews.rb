class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rate
      t.references :user

      t.timestamps null: false
    end
    add_index :reviews, :rate
  end
end
