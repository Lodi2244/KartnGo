class AvailableTimeSlotsController < InheritedResources::Base
  def index
    @timeslots = AvailableTimeSlot.all
  end

  def new
  end

  def create
    @timeslot = AvailableTimeSlot.new(timeslot_params)
      if @timeslot.save
        redirect_to available_time_slots_path(@timeslot)
      else
        render 'index'
      end
  end

    def show
      @timeslot = AvailableTimeSlot.find(params[:id])
    end

    private

    def timeslot_params
      params.require(:available_time_slots).permit(:hour, :track_id)
    end
  end
