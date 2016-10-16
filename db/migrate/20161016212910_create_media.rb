class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :maker
      t.text :description
      t.string :kind

      t.timestamps null: false
    end
  end
end
