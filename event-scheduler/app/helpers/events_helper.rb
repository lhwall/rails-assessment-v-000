module EventsHelper

  def event_time(event)
     event.time.strftime("%H:%M")
  end

  def event_date(event)
    event.date.strftime("%A, %B %e %Y")
  end

end
