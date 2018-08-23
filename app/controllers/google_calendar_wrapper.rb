class GoogleCalendarWrapper
  require 'google/apis/calendar_v3'
  require 'google/api_client/client_secrets.rb'

  def initialize(current_user)
    @secrets = Google::APIClient::ClientSecrets.new({"web" => {"access_token" => current_user.access_token, "refresh_token" => current_user.refresh_token, "client_id" => ENV['GOOGLE_CLIENT_ID'], "client_secret" => ENV['GOOGLE_CLIENT_SECRET']}})
    @cal = Google::Apis::CalendarV3::CalendarService.new
    @cal.authorization = @secrets.to_authorization
    @cal.authorization.refresh!
  end

  def insert_in_calendar(session)
    curr = @cal.list_calendar_lists.items.select do |cal|
      cal.summary == "cBreeze"
    end

    if curr.empty?
      new_cal = Google::Apis::CalendarV3::Calendar.new(summary: "cBreeze")
      cb_cal = @cal.insert_calendar(new_cal)
    else
      cb_cal = curr[0]
    end

    event = Google::Apis::CalendarV3::Event.new(summary: "Kite Session", description: "Super cool kite session", end: get_event_end(session), location: session.forecast.spot.name, start:get_event_start(session), source: "https://www.cbreeze.co/", htmlLink: "https://www.cbreeze.co/")
    @cal.insert_event(cb_cal.id, event) do |result, err|
      if err
        puts err
      end
    end
  end

  def get_event_start(session)
    date = Date.parse(session.forecast.date)
    edt = Google::Apis::CalendarV3::EventDateTime.new
    date_time = DateTime.now.in_time_zone(session.forecast.spot.timezone)
    date_time = date_time.change({year: date.year, month: date.month, day: date.day, hour: session.forecast.time_slot.to_i - 3, min: 0, sec: 0 })
    edt.date_time = date_time.rfc3339
    edt
  end

  def get_event_end(session)
    date = Date.parse(session.forecast.date)
    edt = Google::Apis::CalendarV3::EventDateTime.new
    date_time = DateTime.now.in_time_zone(session.forecast.spot.timezone)
    date_time = date_time.change({year: date.year, month: date.month, day: date.day, hour: session.forecast.time_slot.to_i + 1, min: 0, sec: 0 })
    edt.date_time = date_time.rfc3339
    edt
  end
end
