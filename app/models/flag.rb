class Flag < ActiveRecord::Base
  belongs_to :reporter, class_name: "User", foreign_key: "reporter_id"
  belongs_to :flagged, class_name: "User", foreign_key: "flagged_id"

  validates :reason, presence: true
end
