class CreateCheckoffs < ActiveRecord::Migration
  def change
    create_table :checkoffs do |t|
      t.references :session
      t.references :item
      t.timestamps
    end
  end
end
