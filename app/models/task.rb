class Task < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["completed", "created_at", "id", "title", "updated_at"]
  end
end
