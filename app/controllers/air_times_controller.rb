class AirTimesController < ApplicationController
  #テスト中
  def create
    ait_time = Air_time.create(air_time_params)
    flash[:onair] = "on air予定を追加しました。"
    redirect_to "/samples/#{air_time.sample.id}"
  end

  private
  def air_time_params
    params.require(:air_time).permit(:date, :start_t, :end_t. :onair_t).marge(sample_id: params[:sample_id])
    
  end
end


