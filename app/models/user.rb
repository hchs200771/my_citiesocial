class User < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :orders
  # validations ...............................................................
  # callbacks .................................................................
	# scopes ....................................................................
  # additional config (ex. Enum)..............................................
	# class methods .............................................................
  # public instance methods ...................................................
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar = auth.info.image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  # protected instance methods ................................................
  # private instance methods ..................................................
end
