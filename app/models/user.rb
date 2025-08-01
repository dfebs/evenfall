class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :rooms, through: :memberships
  has_many :messages, dependent: :destroy
  has_one_attached :profile_picture

  validate :valid_image
  validate :is_unique

  def is_unique
    user_with_same_email = User.find_by(email_address: email_address)
    user_with_same_username = User.find_by(username: username)

    return unless !user_with_same_email.nil? || !user_with_same_username.nil?

    errors.add(:base, "Username and/or email is already taken")
  end

  def valid_image
    return unless profile_picture.attached?

    if profile_picture.blob.byte_size > 10.megabytes
      errors.add(:profile_picture, "Image must be lower than 10MB")
    end

    acceptable_types = [ "image/jpeg", "image/png" ]

    unless acceptable_types.include?(profile_picture.blob.content_type)
      errors.add(:profile_picture, "Must be JPG or PNG")
    end
  end


  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
