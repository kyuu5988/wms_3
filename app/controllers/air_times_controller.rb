class AirTimesController < ApplicationController
  
  def create
    air_time = AirTime.create(air_time_params)
    flash[:onair] = "OA予定を追加しました。"
    redirect_to "/samples/#{params[:sample_id]}"
  end

  private
  def air_time_params
    #OA時間の合計をparamsから計算
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
    #ここまで計算して変数へ代入

    params.require(:air_time).permit(:date, :start_t, :end_t).merge(sample_id: params[:sample_id], onair_t: total)
    
  end

end


