class Reservations::SummaryController < ApplicationController
    def get_summary
        massage = {
            "massage": "Success"
          }
        render :json => massage
    end
end
