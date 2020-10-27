class ResumesController < ApplicationController

  #新規サンプル作成用履歴保存
  def rireki
    #loc = params[:sample][:ロケーション] #params ck用
    #render plain: loc #テキストのみで画面に表示

    resume = Resume.new(
    user_id: current_user[:id],
    sample_id: params[:format],#なぜ format が id なのか不明だが取得できた
    ロケーション旧: "新規登録",
    ロケーション新: params[:sample][:ロケーション],
    name: current_user[:name],
    group: current_user[:group] )

    resume.save
    redirect_to new_sample_path, notice: '登録完了・続けて登録可能'
  end


end
