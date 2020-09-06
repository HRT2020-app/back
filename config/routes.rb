Rails.application.routes.draw do
    get "reservations" => "reservations#get_reservations_by_start_end"
    post "reservations" => "reservations#create"
    delete "reservations/:id" => "reservations#destroy"

    namespace :reservations do
        get "calendar" => "calendar#get_calendar"
        get "summary" => "summary#get_summary"
    end
end
