class Reservation < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
  validates :schedule_id, uniqueness: { scope: %i[sheet_id date] }

  belongs_to :sheet
  belongs_to :schedule
end
