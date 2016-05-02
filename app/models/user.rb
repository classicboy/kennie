class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable, :omniauth_providers => [:facebook]

  # validates_presence_of   :avatar
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar

  has_one :collection
  has_many :reviews
  has_many :orders
  after_create :create_collection

  enum role: [:user, :admin]

  def self.from_omniauth(auth)
    user =  User.where(email: auth.info.email).first
    if user
      user.update(confirmed_at: Time.now)
    else
      User.create(confirmed_at: Time.now, provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20])
    end
    user
  end

  private
  def create_collection
    Collection.create(user_id: id)
  end
end
