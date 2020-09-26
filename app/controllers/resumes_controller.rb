class ResumesController < ApplicationController
  #履歴保存テスト中
  def new
    @resume = Resume.new
    @resume.save(ロケーション新: params[:sample][:ロケーション])
  
  end


end
