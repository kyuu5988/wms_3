class AirTimesController < ApplicationController
  
  def create
    air_time = AirTime.create(air_time_params)
    #onair_t計算実験

    flash[:onair] = "OA予定を追加しました。"
    redirect_to "/samples/#{params[:sample_id]}"
  end

  private
  def air_time_params
    #test
    et4 = params[:air_time]["end_t(4i)"].to_i
    et5 = params[:air_time]["end_t(5i)"].to_i
    et6 = params[:air_time]["end_t(6i)"].to_i

    st4 = params[:air_time]["start_t(4i)"].to_i
    st5 = params[:air_time]["start_t(5i)"].to_i
    st6 = params[:air_time]["start_t(6i)"].to_i

    tt4 = et4 - st4
    tt5 = et5 - st5
    tt6 = et6 - st6

    total = "#{tt4}:#{tt5}:#{tt6}"
    

    params.require(:air_time).permit(:date, :start_t, :end_t).merge(sample_id: params[:sample_id], onair_t: total)
    
  end

  # def onair_total_time(air_time)
  #   total = air_time.end_t - air_time.start_t
    
  # end

end


