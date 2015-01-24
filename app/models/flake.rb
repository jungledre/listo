class Flake < ActiveRecord::Base
  belongs_to :event
  belongs_to :nark, class_name: "User", foreign_key: "nark_id"
  belongs_to :flaked, class_name: "User", foreign_key: "flaked_id"
end
