uclass CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
