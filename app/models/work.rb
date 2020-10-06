class Work < ApplicationRecord

	mount_uploaders :image, ImageUploader
	belongs_to :member
	belongs_to :genre

	has_many :favorites

    def favorite_by?(member)
    	favorites.where(member_id: member.id).exists?
    end
end
