class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one :profile
  has_one :feed, through: :profile
end
