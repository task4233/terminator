# -*- coding: utf-8 -*-
module Sns::Tw extend self
  def batch
    
    # User.allで全て取り出す
    users = User.all
    # 1つ1つのユーザに対して, distance_of_monthsが0のものを抽出する
    users.each do |user|
      tasks = user.tasks.all
      tasks.each do |task|
        tweet_task(user, task) if distance_of_months(task.deadline)=='0日'
      end
    # もし文字数が200文字を超えた場合, 2つ目のツイートに移行
    end
    
  end

  private
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
    
    def tweet_task(user, task)
       client = Twitter::REST::Client.new do |config|
         config.consumer_key        = ENV['POST_TWITTER_API_KEY']
         config.consumer_secret     = ENV['POST_TWITTER_API_SECRET_KEY']
         config.access_token        = ENV['POST_TWITTER_ACCESS_TOKEN']
         config.access_token_secret = ENV['POST_TWITTER_ACCESS_TOKEN_SECRET']
       end
      
       res = "@#{user.username}\n"
       res += "#{user.name}さんの#{task.name}の締め切りは本日に設定されています。\n"
       res += "頑張って終わらせましょう!\n"
       res += "https://task4233-terminator.herokuapp.com/"
       client.update(res)
     end

end
