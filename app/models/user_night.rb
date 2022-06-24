class UserNight < ApplicationRecord
  belongs_to :user
  belongs_to :night
end
