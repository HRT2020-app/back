class ReservationsController < ApplicationController
  def get_reservations_by_start_end
    date_range = date_range_param
    if date_valid?(date_range[:start]) && date_valid?(date_range[:end])
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
    else
      response_bad_request
    end 
  end

  def create_reservation
    p reservation_param
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

  private def date_range_param
      params.permit(:start, :end)
  end

  private def reservation_param
    params.require(:reservation).permit(:name, :in, :out)
end

  private def date_valid?(str)
      begin
        y, m, d = str.split("-").map(&:to_i)
        return Date.valid_date?(y, m, d)
      rescue
        return false
      end
  end
end
