class Flag < ActiveRecord::Base
  belongs_to :reports, class_name: "User", foreign_key: "reporter_id"
  belongs_to :flags, class_name: "User", foreign_key: "flagged_id"
end
