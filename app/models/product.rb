class Product < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  include CodeGenerator
  has_one_attached :cover_image
  has_rich_text :description
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :vendor
  belongs_to :category, optional: true
  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
  # validations ...............................................................
  validates :name, presence: true
  validates :code, uniqueness: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }
  # callbacks .................................................................
	# scopes ....................................................................
  # additional config (ex. Enum)..............................................
	# class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
end
