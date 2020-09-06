Rails.application.routes.draw do
    get "reservations" => "reservations#get_reservations_by_start_end"
    post "reservations" => "reservations#create_reservation"
    delete "reservations/:id" => "reservations#delete_reservation"

    namespace :reservations do
        get "calendar" => "calendar#get_calendar"
        get "summary" => "summary#get_summary"
    end
end
