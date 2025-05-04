class Employee < ApplicationRecord
    has_many :time_off_requests, dependent: :destroy
end
