# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def failure
    redirect_to root_url, alert: "認証失敗..."
  end
end
