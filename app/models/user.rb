class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :events
  has_many :messages
  has_many :flakes, foreign_key: "flaked_id"
  has_many :narks, class_name: "Flake", foreign_key: "nark_id"
  has_many :flags, foreign_key: "flagged_id"
  has_many :reports, class_name: "Flag", foreign_key: "reporter_id"

  validates :first_name, presence: true,
    length: {
      maximum: 40
    }
  validates :last_name, presence: true
    length: {
      maximum: 40
    }
  validates :email, presence: true,
    uniqueness: true,
    :email => true
  validates :password,
    length: {
      minimum: 5,
      maximum: 1000
    }

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation
end
