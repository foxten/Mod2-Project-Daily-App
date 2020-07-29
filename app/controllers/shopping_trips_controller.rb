class ShoppingTripsController < ApplicationController
    before_action :find_shopping_trip, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @shopping_trip = ShoppingTrip.new
    end
    
    def create
        @shopping_trip = ShoppingTrip.new(shopping_trip_params)
        @shopping_trip.user_id = @current_user.id
        if @shopping_trip.save
            redirect_to @shopping_trip
        else
            redirect_to new_shopping_trip_path
        end
    end

    def edit
    end

    def update
        @shopping_trip.update(shopping_trip_params)
        if @shopping_trip.save
            redirect_to @shopping_trip
        else
            redirect_to edit_shopping_trip_path
        end
    end

    def destroy
        @shopping_trip.destroy
        redirect_to user_profile_path
    end

    private
    def find_shopping_trip
        @shopping_trip = ShoppingTrip.find(params[:id])
    end

    def shopping_trip_params
        params.require(:shopping_trip).permit(:store, :receipt_total, :online)
    end
end
