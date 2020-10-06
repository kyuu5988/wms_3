class AirTimesController < ApplicationController
  
  def create
    air_time = AirTime.create(air_time_params)
    #onair_t計算実験
    # air_time = AirTime.find()
    # total = air_time.end_t - air_time.start_t
    # air_time.update(onair_t: total)

    flash[:onair] = "OA予定を追加しました。"
    redirect_to "/samples/#{params[:sample_id]}"
  end

  private
  def air_time_params
    #test
    # total = params[:air_time][:end_t]

    params.require(:air_time).permit(:date, :start_t, :end_t, :onair_t).merge(sample_id: params[:sample_id])
    
  end

  # def onair_total_time(air_time)
  #   total = air_time.end_t - air_time.start_t
    
  # end

end


