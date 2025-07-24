class Room < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :messages, dependent: :destroy

  def owner
    self.memberships.find_by(role: "owner")&.user
  end
end
