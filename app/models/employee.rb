class Employee < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :employee_number
  end
  belongs_to :user
end
