class Genre < ApplicationRecord
	has_many :works, dependent: :destroy

  	validates :name, presence: true, uniqueness: true

  	scope :only_valid_status, -> {where(valid_status: true)}
end
