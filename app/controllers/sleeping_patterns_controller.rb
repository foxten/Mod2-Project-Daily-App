class SleepingPatternsController < ApplicationController
    
    def index
        @sleeping_patterns = SleepingPattern.all
    end
    
    def show
        @sleeping_pattern = SleepingPattern.find(params[:id])
    end

    def new
        @sleeping_pattern = SleepingPattern.new
    end    
    #create
    def create
        @sleeping_pattern = SleepingPattern.new(sleeping_params)
        @sleeping_pattern.user_id = @current_user.id
        @sleeping_pattern.save
        redirect_to @sleeping_pattern
    end    
    #edit
    def edit
        @sleeping_pattern = SleepingPattern.find(params[:id])
    end    
    #update
    def update 
        @sleeping_pattern = SleepingPattern.find(params[:id]) 
        @sleeping_pattern.update(sleeping_params)
        redirect_to @sleeping_pattern
    end    
    #delete
    def destroy
        @sleeping_pattern = SleepingPattern.find(params[:id])
        
        @sleeping_pattern.destroy
        redirect_to user_profile_path(@current_user)
    end    
    #private
    #sleeping_params
    private

    def sleeping_params
        params.require(:sleeping_pattern).permit(:location, :average_sleep, :position, :grade, :date)
    end  

end
