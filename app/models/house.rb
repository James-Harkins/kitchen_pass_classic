class House < ApplicationRecord
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :realty_link
  validates_presence_of :guest_capacity

  belongs_to :trip
end
