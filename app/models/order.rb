class Order < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  include AASM

  aasm(column: 'state', no_direct_assignment: true, timestamps: true) do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :pending, to: :paid
      before do |args|
        self.transaction_id = args[:transaction_id]
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :cancel do
      transitions from: [:pending, :paid, :delivered], to: :cancelled
    end
  end
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :user
  has_many :order_items
  # validations ...............................................................
  validates :recipient, :tel, :address, presence: true
  # callbacks .................................................................
  before_create :num_generator
	# scopes ....................................................................
  # additional config (ex. Enum)..............................................
	# class methods .............................................................
  # public instance methods ...................................................
  def total_price
    order_items.reduce(0) { |sum, item| sum + item.total_price }
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
  private

  def num_generator
    self.num = SecureRandom.hex(5) unless num
  end
end
