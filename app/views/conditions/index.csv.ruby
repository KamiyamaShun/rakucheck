require 'csv'

CSV.generate do |csv|
  column_names = %w(名前 日付 体温 手指状態 消化器症状 その他症状)
  csv << column_names
  @conditions.each do |condition|
    column_values = [
      condition.employee.name,
      condition.created_at_date,
      condition.temperature,
      condition.fingers_status.name,
      condition.gastrointestinal_symptom.name,
      condition.other_symptoms,
    ]
    csv << column_values
  end
end