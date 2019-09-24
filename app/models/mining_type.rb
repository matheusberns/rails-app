class MiningType < ApplicationRecord
  has_many :coins
  acts_as_paranoid
end
