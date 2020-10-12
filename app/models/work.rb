class Work < ApplicationRecord

	mount_uploaders :image, ImageUploader

	belongs_to :member
	belongs_to :genre

	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	scope :where_genre_active, -> { joins(:genre).where(genres: { is_active: true }) }

	validates :name, presence: true
	validates :introduction, presence: true
	validate :image_cunte_max
	validate :image_cunte_min


    def favorite_by?(member)
    	favorites.where(member_id: member.id).exists?
    end

    def image_cunte_max
    	if image.count > 5
    		errors.add(:image, "画像は5枚以下にして下さい")
    	end
	end

	def image_cunte_min
    	if image.count < 1
    		errors.add(:image, "画像は1枚以上にして下さい")
    	end
	end
end
