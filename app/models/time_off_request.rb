class TimeOffRequest < ApplicationRecord
  belongs_to :employee
  enum :status, {
      pending: 0,
      in_progress: 1,
      approved: 2
  }
end
