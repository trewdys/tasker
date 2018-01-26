class Task < ApplicationRecord
    validates :title, :start_date, :start_time, :end_date, :end_time, presence: true
end
