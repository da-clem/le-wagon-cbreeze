module ApplicationHelper
  def nav_classes(path)
    classes = [
      'navbar-wagon-item',
      'navbar-wagon-link'
    ]

    classes << 'active' if current_page?(path)

    classes.join(' ')
  end

  def nav_link(text, path)
    link_to text, path, class: nav_classes(path)
  end

  def wind_min
    current_user.pref_wind_speed_min == 0.0 ? 10 : @user.pref_wind_speed_min
  end

  def wind_max
    current_user.pref_wind_speed_max == 0.0 ? 22 : @user.pref_wind_speed_min
  end

  def waves_min
    current_user.pref_wave_height_min == 0.0 ? 0.0 : @user.pref_wave_height_min
  end

  def waves_max
    current_user.pref_wave_height_max == 0.0 ? 1.0 : @user.pref_wave_height_max
  end

  def get_day_and_date(session)
    Date.parse(session.forecast.date).strftime("%A - %d %b")
  end

  def get_timeslot(session)
    case session.forecast.time_slot
    when "11"
      "Morning"
    when "15"
      "Afternoon"
    else
      "Evening"
    end
  end
end
