class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :book do |t|
    t.string :title
    t.string :body
    t.integer :user_id
      t.timestamps
    end
  end
end
