class WorkExperience < ApplicationRecord
  belongs_to :user
  validates :description,  presence: true, length: { maximum: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_date_after_start_date?

	def end_date_after_start_date?
	  if end_date < start_date
	    errors.add :end_date, "Must be after start date"
	  end
	end
end
