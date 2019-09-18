class Coin < ApplicationRecord
  belongs_to :mining_type, class_name: "MiningType" #optional: true
end
