class ResumesController < ApplicationController
  #履歴保存テスト中

  #独自アクションで履歴保存
  def rireki
    #以下の2行はパラメーターの中身確認用。不要の時はcomment out
    #loc = params[:sample][:ロケーション]
    #render plain: loc #←テキストのみで画面に表示

    resume = Resume.new(
    user_id: current_user[:id],
    sample_id: params[:format],#なぜ format が id なのか不明だが取得できた
    ロケーション新: params[:sample][:ロケーション],
    name: current_user[:name],
    group: current_user[:group] )

    resume.save
    redirect_to new_sample_path, notice: '登録完了・続けて登録可能'
  end

  private

  #ここは使っていない。（以下のコードは全て効果無い状態）

  # def resume_params
  #   params.require(:sample).permit(ロケーション新: params[:sample][:ロケーション])
    #params.require(:sample).permit(:基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :カラー, :ロケーション, :rent )

  # end


end
