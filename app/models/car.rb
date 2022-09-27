class Car < ApplicationRecord
  extend FriendlyId

  include Filterable
  before_create :set_hash_id, if: Proc.new {|car| car.hash_id.nil?}

  validates :photo, presence: true, format: { with: URI::regexp(%w(http https)), message:"Valid URL photo required"}
  validates :make, presence: true
  validates :model, presence: true

  enum currency: %i(EUR)
  enum unit: %i(Km)

  serialize :colors, Array
  friendly_id :hash_id, use: :slugged
  scope :make, -> (make) { where("lower(make) like ?", "#{make.downcase}%")}
  scope :min_price, ->(min_price) { where('price > ?', min_price) }
  scope :max_price, ->(max_price) { where('price < ?', max_price) }

  private
  def set_hash_id
    self.hash_id = SecureRandom.hex(6)
    self.slug = self.hash_id
  end
end
