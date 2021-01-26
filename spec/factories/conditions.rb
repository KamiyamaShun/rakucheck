FactoryBot.define do
  factory :condition do
    temperature {35.5}
    fingers_status_id {2}
    gastrointestinal_symptom_id {2}
    other_symptoms {'咳'}
    association :user 
    association :employee 
  end
end
