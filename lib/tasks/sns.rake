namespace :sns do
  desc "朝にツイートするタスク"
  task twitter: :environment do
    Sns::Tw.batch
  end  
end
