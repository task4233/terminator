# -*- coding: utf-8 -*-
class User < ApplicationRecord

  has_many :tasks, dependent: :destroy

  # ---------------------------ここからdeviseの設定---------------------------
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.username = auth["info"]["nickname"]
      user.name     = auth["info"]["name"]
      user.email    = dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end

    # puts('res.persisted? == true になってないです!!!') unless res.persisted? == true

  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else 
      super
    end
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
