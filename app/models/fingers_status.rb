class FingersStatus <  ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '良好' },
    { id: 3, name: '傷・ささくれ' },
    { id: 4, name: '手荒れ' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
