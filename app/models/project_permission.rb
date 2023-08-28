class ProjectPermission < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project_id, presence: true
  validates :user_id, presence: true
  validates :access, presence: true, inclusion: { in: %w[editor viewer] }
end