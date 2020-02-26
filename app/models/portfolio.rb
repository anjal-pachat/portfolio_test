class Portfolio < ApplicationRecord
	has_many :technologies

	accepts_nested_attributes_for :technologies, 
								   reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image
	

   #custome scopes
	def self.angular
		where(subtitile:'angular')
    end
    #another custom scope
    scope :ruby_on_rails_portfolio_items, -> { where(subtitile:'Ruby on Rails') }

    after_initialize :set_defaults

    def set_defaults
    	self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    	self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end