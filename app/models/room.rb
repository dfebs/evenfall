class Room < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :messages, dependent: :destroy

  validates_size_of(:name, within: 1..50)
  validates_size_of(:description, within: 1..200)

  def owner
    self.memberships.find_by(role: "owner")&.user
  end
end
