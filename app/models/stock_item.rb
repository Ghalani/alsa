class StockItem < ActiveRecord::Base
  after_save  :destroy_original_image
  belongs_to  :organization
  belongs_to  :stock_type
  has_many    :stored_stocks
  has_many    :ordered_stocks
  has_many    :outgoing_stocks
  has_many    :incoming_stocks

  validates   :name, presence: true
  validates   :organization_id, presence: true
  validates   :stock_type_id, presence: true
  validates_uniqueness_of :name, scope: :organization_id
  
  has_attached_file :image, styles: { large: "600X600#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/organization.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def image_url
    url = Hash.new
    url[:thumb] = image.url(:thumb)
    url[:medium] = image.url(:medium)
    url[:large] = image.url(:large)
    url
  end

  def as_json(options = {})
    super(options.merge({ except: [:updated_at, :created_at] }))
  end


  private

    def destroy_original_image
      File.unlink(self.photo.path)
    end
end
