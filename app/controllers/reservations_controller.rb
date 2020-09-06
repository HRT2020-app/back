class ReservationsController < ApplicationController
    def get_reservations_by_start_end
        reservations = {
            "reservations": [
              {
                "id": 10,
                "name": "伊藤鈴奈",
                "in": "2020-08-24T10:00:00.000Z",
                "out": "2020-08-24T19:30:00.000Z"
              }
            ]
          }
        render :json => reservations
    end

    def create_reservation
        massage = {
            "massage": "Success"
          }
        render :json => massage
    end

    def delete_reservation
        massage = {
            "massage": "Success"
          }
        render :json => massage
    end
end
