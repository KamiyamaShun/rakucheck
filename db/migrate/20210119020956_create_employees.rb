class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name,             null: false 
      t.string :employee_number, null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
