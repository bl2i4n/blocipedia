class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :new
      t.string :create

      t.timestamps null: false
    end
  end
end
