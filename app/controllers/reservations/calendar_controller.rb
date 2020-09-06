class Reservations::CalendarController < ApplicationController
    def get_calendar
        calendar = {
            "reservations": [
              {
                "start": "2020-08-24T19:30:00.000Z",
                "number": 1
              }
            ]
          }
        render :json => calendar
    end
end
