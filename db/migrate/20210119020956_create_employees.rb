class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name,             null: false 
      t.integer :employee_number, null: false, unique: true
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
