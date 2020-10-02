class AirTimesController < ApplicationController
  #テスト中
  def create
    air_time = AirTime.create(air_time_params)
    flash[:onair] = "OA予定を追加しました。"
    redirect_to "/samples/#{params[:sample_id]}"
  end

  private
  def air_time_params
    params.require(:air_time).permit(:start_t).merge(sample_id: params[:sample_id])
    
  end
end


