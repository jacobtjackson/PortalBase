class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :coinbase]

  def self.find_for_oauth(auth, current_user)
    identity = Identity.find_or_initialize_by(provider: auth.provider, uid: auth.uid.to_s)

    user = current_user || find_by(email: auth.info.email)

    if user.nil?
      user = User.new(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )

      user.save!
    end

    if identity.user != user
      identity.user = user
    end

    identity.save if identity.changed?

    user
  end
end
