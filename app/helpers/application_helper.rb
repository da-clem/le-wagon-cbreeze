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

  def get_day_and_date_old(session)
    Date.parse(session.forecast.date).strftime("%A - %d %b")
  end

  def get_day_and_date(day)
    Date.parse(day).strftime("%A - %d %b")
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

  def check_if_preferences_match(forecast)
     if forecast.wave_heigth >= current_user.pref_wave_height_min &&
      forecast.wave_heigth <= current_user.pref_wave_height_max &&
      forecast.wind_speed >= current_user.pref_wind_speed_min &&
      forecast.wind_speed <= current_user.pref_wind_speed_max
      return "card-within-preference"
    else
      return "card-outside-preference"
    end
  end
end
