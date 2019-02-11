# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def index
    @user  = current_user if user_signed_in?
  end
end
