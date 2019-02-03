class BallotGroup < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :members, class_name: 'User'
end