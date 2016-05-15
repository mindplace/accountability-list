class CreateCheckoffs < ActiveRecord::Migration
  def change
    create_table :checkoffs do |t|
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end
