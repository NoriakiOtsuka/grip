class Chat < ApplicationRecord
  belongs_to :tourist
  belongs_to :guide
  belongs_to :schedule

  validates :message, presence: true
  validates :sender, inclusion: {in: [true, false]}
end
