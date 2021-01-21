class GastrointestinalSymptom < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '良好' },
    { id: 3, name: '腹痛' },
    { id: 4, name: '下痢' },
    { id: 5, name: '嘔吐' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
