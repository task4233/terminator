module ApplicationHelper
  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
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
