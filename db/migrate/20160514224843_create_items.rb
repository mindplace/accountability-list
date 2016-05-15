class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :list_item, null: false
      t.references :user
      t.references :list
      t.timestamps null: false
    end
  end
end
