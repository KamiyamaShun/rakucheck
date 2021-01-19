FactoryBot.define do
  factory :employee do
    name {'aaaa'}
    employee_number {'1234'}
    association :user 
  end
end
