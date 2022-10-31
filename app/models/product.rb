class Product < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  include CodeGenerator
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :vendor
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
  private
end