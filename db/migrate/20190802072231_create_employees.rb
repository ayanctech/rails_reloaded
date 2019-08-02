class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name,null: false
      t.string :email,null: false
      t.string :phone,null: false

      t.index [:name], unique: true
      t.index [:email], unique: true
      t.index [:phone], unique: true

      t.timestamps
    end
  end
end
