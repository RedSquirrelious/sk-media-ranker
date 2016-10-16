class Medium < ActiveRecord::Base
	has_many :votes, dependent: :destroy
	validates :title, presence: true
	validates :maker, presence: true
	validates :description, presence: true
	validates :kind, presence: true
end
