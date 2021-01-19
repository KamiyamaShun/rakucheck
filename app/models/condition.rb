class Condition < ApplicationRecord
  validates :temperature, presence: true, format: {with: /\A[0-9]+(\.[0-9]+)?\z/, message: 'を半角数字で入力してください'}

  with_options numericality: { other_than: 1, message: 'を選んでください'} do
    validates :fingers_status_id
    validates :gastrointestinal_symptoms_id
  end

  belongs_to :user
  belongs_to :employee
end
