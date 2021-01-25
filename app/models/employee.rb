class Employee < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :employee_number,format: {with: /\A[0-9]+\z/, message: 'を半角数字で入力してください'}
  end

  belongs_to :user
  has_many :conditions
end
