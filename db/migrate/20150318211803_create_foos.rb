class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :title, null: false
      t.text :bar, null: false

      t.timestamps null: false
    end
  end
end
