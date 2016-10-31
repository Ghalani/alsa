class Labourer < ActiveRecord::Base
	belongs_to	:organization
	belongs_to	:village
	has_attached_file :image, styles: { large: "600X600#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/labourer.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	enum gender: [:male, :female]

	def image_url
    url = Hash.new
    url[:thumb] = image.url(:thumb)
    url[:medium] = image.url(:medium)
    url[:large] = image.url(:large)
    url
  end
end
