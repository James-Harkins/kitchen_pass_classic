class Night < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :cost_per_person

  belongs_to :trip
end
