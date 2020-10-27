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

    #ソート用カラム保存設定
    st_mm = params[:air_time]["start_t(5i)"].to_s
    st_ss = params[:air_time]["start_t(6i)"].to_s#00秒対策
    start_time = "#{st4}#{st_mm}#{st_ss}"

    #OA予定保存先sample_id固定（001#1）設定
    sam_now = Sample.find(params[:sample_id]) 
    no = sam_now[:申込番号] #6桁の申込番号取得 
    sam_top = Sample.find_by(申込番号: no) #同品番の最初のみ取得

    params.require(:air_time).permit(:date, :start_t, :end_t).merge(sample_id: sam_top[:id], onair_t: total, sort_t: start_time)
    
  end

end

