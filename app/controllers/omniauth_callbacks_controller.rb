# -*- coding: utf-8 -*-
class OmniauthCallbacksController < ApplicationController
  def twitter
    callback_from :twitter
  end
  
  def failure
    redirect_to root_url, alert: "認証に失敗しました"
  end

  private
  def callback_from(provider)
    provider = provider.to_s
    
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    
    if @user.persisted?
      flash[:success] = "Twitterアカウントでログインしました!"
      sign_in_and_redirect @user
    else
      flash[:notice] = "Twitterアカウントでのログインに失敗しました..."
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
