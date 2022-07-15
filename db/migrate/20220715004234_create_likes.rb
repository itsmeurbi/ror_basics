class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :likeable, null: false, polymorphic: true
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
