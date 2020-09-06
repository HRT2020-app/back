class ReservationsController < ApplicationController
  def get_reservations_by_start_end
    date_range = date_range_params
    if date_valid?(date_range[:start]) && date_valid?(date_range[:end])
      start_date = DateTime.parse(date_range[:start])
      end_date = DateTime.parse(date_range[:end])

      @reservations = Reservation.where(["in_room < ? and out_room > ?", end_date, start_date])
   
      render 'reservations/reservations'
    else
      response_bad_request
    end 
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      massage = {
        "massage": "Create Success"
      }
      render :json => massage
    else
      response_bad_request
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    if reservation
      if reservation.destroy
        massage = {
            "massage": "Destroy Success"
          }
        render :json => massage   
      else
        response_bad_request
      end
    else
      response_not_found
    end
  end

  private def date_range_params
      params.permit(:start, :end)
  end

  private def reservation_params
    params.require(:reservation).permit(:name, :in_room, :out_room)
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
