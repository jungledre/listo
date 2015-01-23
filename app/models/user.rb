class User < ActiveRecord::Base
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :events
  has_many :messages
  has_many :flakes, foreign_key: "flaked_id"
  has_many :narks, class_name: "Flake", foreign_key: "nark_id"
  has_many :flags, foreign_key: "flagged_id"
  has_many :reports, class_name: "Flag", foreign_key: "reporter_id"
end
