class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.float :temperature, null: false, precision: 3, scale: 1
      t.integer :fingers_status_id, null: false
      t.integer :gastrointestinal_symptoms_id, null: false
      t.text :other_symptoms
      t.references :user, foreign_key: true
      t.references :employee, foreign_key: true
      t.timestamps
    end
  end
end
