class Tourist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :schedules
	has_many :tourist_comments

	attachment :profile_image, destroy: false

	enum gender: {male: 0, female: 1}
	enum status: {有効: 0, 退会: 1}
end
