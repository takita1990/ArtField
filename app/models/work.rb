class Work < ApplicationRecord

	mount_uploaders :image, ImageUploader
	belongs_to :member
	belongs_to :genre

	has_many :favorites
	has_many :post_comments, dependent: :destroy
	accepts_nested_attributes_for :images

    def favorite_by?(member)
    	favorites.where(member_id: member.id).exists?
    end
end
