class Tourist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :schedules
	has_many :tourist_comments
	has_many :chats
	has_many :blogs

	has_many :favorites, dependent: :destroy
 	def favorited_by_tourist?(tourist) #tourist_signed_in?時の定義 /blogs/_favorite.html.erb
 		self.favorites.where(tourist_id: tourist.id).exists?
 	end

	attachment :profile_image, destroy: false

	enum gender: {male: 0, female: 1}
	enum status: {有効: 0, 退会: 1}

	scope :get_by_tourist_name, -> (tourist_name) {where("first_name Like ? OR last_name Like ?", "%#{params[:tourist_name]}%", "%#{params[:tourist_name]}%").pluck(:id)}

end
