# -*- coding: utf-8 -*-
class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def index
    @tasks = Task.all
    @task  = current_user.tasks.build if user_signed_in?
    @user  = current_user if user_signed_in?
  end

  def new
    @task = Task.new
  end 

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Todoが作成されました！"
      redirect_to root_url
    else
      render '_task_form'
    end
  end

  def show
    @task = current_user.tasks.find_by(user_id: current_user.id)
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update 
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])    
    tweet_task @task
    @task.destroy
    
    redirect_to root_path
  end

  private
  def task_params 
    params.require(:task).permit(:name, :deadline)
  end
  
  def tweet_task(task)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['POST_TWITTER_API_KEY']
      config.consumer_secret     = ENV['POST_TWITTER_API_SECRET_KEY']
      config.access_token        = ENV['POST_TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['POST_TWITTER_ACCESS_TOKEN_SECRET']
    end

    rnd = rand(100)
    # puts(rnd)
    # puts("hoge")
    # 30%の確率でツイート
    # return if rnd > 30
      
    res = "@#{current_user.username}\n"
    res += "#{current_user.name}さんが期限の#{distance_of_months(task.deadline)}前に#{task.name}を完了しました!"
    client.update(res)
  end

  def distance_of_months(from_time, to_time = Date.current)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time     if to_time.respond_to?(:to_time)
    from_time, to_time = to_time, from_time if from_time > to_time
    distance_in_minutes = ((to_time - from_time)/60.0).round
    I18n.with_options :scope => 'datetime.distance_in_words' do |locale|
      case distance_in_minutes
      when 0...43200 then locale.t :x_days,   :count => (distance_in_minutes.to_f / 1440.0).round
      else                locale.t :x_months, :count => (distance_in_minutes.to_f / 43200.0).round
      end
    end
  end

end
