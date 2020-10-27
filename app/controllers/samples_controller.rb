class SamplesController < ApplicationController
  before_action :set_sample, only: [:edit, :show]

  def new
    @sample = Sample.new
  end
  #サンプル登録
  def create
    @sample = Sample.new(sample_params)
    if @sample.save
      @sample.update(rent: "")
      #↓操作履歴保存用アクションへ
      redirect_to rireki_path(@sample.id, request.parameters)
      #↑パスでパラメーターを送る(@sample.id, request.parameters)
      
      #↓以前の設定（履歴保存なし）
      # redirect_to new_sample_path, notice: '登録完了・続けて登録可能'
    else
      flash[:already] = "入力内容に不備があります。"
      render :new #バリデーションのエラー表示はこっち
      #redirect_to new_sample_path,notice: '入力に誤りがあります'
    end
  end

  def edit
  end
  #サンプル個別詳細＋履歴＋OA登録・表示
  def show
    #履歴表示用（新しい順に）
    @resumes = Resume.where(sample_id: @sample.id).order("created_at DESC")
    #air_time登録用
    @air_time = AirTime.new

    #air_time表示用（picT参考）アソシエーション利用時専用
    # @air_times = @sample.air_times.order("date DESC").order("sort_t")

    #現在はair_time登録時sample_id固定の為以下の記述利用
    no = @sample[:申込番号] #[]を使ってカラムを指定 
    sam_top = Sample.find_by(申込番号: no) #同品番の最初のみ取得

    @air_times = AirTime.where(sample_id: sam_top[:id]).order("date DESC").order("sort_t")
  end
  
  #url貸出返却用
  def update
    @sample = Sample.find(params[:id])
    @old_loc = @sample.ロケーション#旧ロケ取得
    if @sample.update(ロケーション: params[:sample][:ロケーション])
      #↑paramsの中から希望のデータを出している
      @sample.update(rent: "" )
      set_resume#履歴用

      flash[:already] = "返却が正常に完了しました。"
      render :done_move_one
    else
      flash[:already] = "ロケーション情報を入力して下さい"
      render :done_move_one
      #redirect_to root_path, notice: '正しく完了しませんでした。戻って正しいロケーションを入力して下さい'
    end
  end
  
  #通常サンプル単品編集用※履歴保存未設定
  def update2
    sample = Sample.find(params[:sample_id]) 
    if sample.update(sample_params)
      redirect_to edit_sample_path(sample.id), notice: '正常に変更されました。'
    else

      redirect_to edit_sample_path(sample.id), notice: '入力内容が正しくありません。'
    end
  end
  
  #サンプル検索
  def search
    #ロケーション内検索用
    if params[:ロケーション]
      @samples = Sample.search2(params[:ロケーション])
      @keyword = (params[:ロケーション])
      flash[:all_sample_in_loc] = "ロケーション内の全サンプル検索です"#1
    #申込番号、商品名
    else
      @samples = Sample.search(params[:keyword])
      @keyword = (params[:keyword])
      flash[:all_sample_in_loc] = "" #viewに#1のメッセージが出るにを防止
    end
  end


#ここから独自アクション（自動ロケーション更新機能）

  #同品番、同時変更 (移動先 = 所属/モード次第)
  def auto_move_ast
    if current_user[:group] == "Stylist" ||
       current_user[:group] == "Cast" ||
       current_user[:group] == "Still Image" ||
       current_user[:group] == "Promotion"
       #何もしない（ロケ移動できない）
       #flash[:already] = "権限がありません。（スタジオ移動のコードです）"
       redirect_to root_path, notice: "権限がありません。ST移動用コードです"

    else
      @sample = Sample.find(params[:sample_id]) 
      #3000/samples/id/auto_move_astでレコード指定
      no = @sample[:申込番号] #[]を使ってカラムを指定 
      @products = Sample.where(申込番号: no) #同品番を取得
      
      @products.each do |pro|
        if pro[:ロケーション] == "Stylist" ||
           pro[:ロケーション] == "Cast" ||
           pro[:ロケーション] == "Still Image" ||
           pro[:ロケーション] == "Promotion"
           #何もしない（ロケ移動できない）
           flash[:already] = "貸出中です。"

        else
          # inv 入庫用
          if current_user.mode == "AST-1F" ||
             current_user.mode == "AST-2F" ||
             current_user.mode == "AST-7F" ||
             current_user.mode == "INV-4F"

            old_loc = pro.ロケーション#旧ロケ取得

            pro.update(ロケーション: current_user[:mode])

            resume = Resume.new(
              user_id: current_user[:id],
              sample_id: pro.id,
              ロケーション旧: old_loc,#ロケ更新前に取得
              ロケーション新: pro.ロケーション,
              name: current_user[:name],
              group: current_user[:group] )    
              resume.save


            flash[:already] = "#{current_user[:mode]}へ移動しました"
          else
            old_loc = pro.ロケーション#旧ロケ取得

            pro.update(ロケーション: current_user[:group] )

            resume = Resume.new(
              user_id: current_user[:id],
              sample_id: pro.id,
              ロケーション旧: old_loc,#ロケ更新前に取得
              ロケーション新: pro.ロケーション,
              name: current_user[:name],
              group: current_user[:group] )    
              resume.save


            flash[:already] = "ロケーションの移動が完了しました。"
          end

        end

      end
      render :done_move #記述は一つのみ
    end

  end


  #単品貸出 / pick用
  def auto_move_one_sty
    @sample = Sample.find(params[:sample_id]) 
    if @sample[:ロケーション] == "Stylist" ||
       @sample[:ロケーション] == "Cast" ||
       @sample[:ロケーション] == "Still Image" ||
       @sample[:ロケーション] == "Promotion"

      flash[:already] = "#{@sample.rent}がすでに貸出処理されています。"
      render :done_move_one

    #集荷モード用
    elsif current_user.mode == "SYUKA-A" ||
          current_user.mode == "SYUKA-C" ||
          current_user.mode == "INV-4F"
          
      @old_loc = @sample.ロケーション#旧ロケ取得
      @sample.update(ロケーション: current_user[:mode] )
      
      set_resume#履歴用

      flash[:already] = "#{current_user[:mode]}へ移動しました"
      render :done_move_one

    #貸出処理用
    else 
      @old_loc = @sample.ロケーション#旧ロケ取得
      @sample.update(ロケーション: current_user[:group] )
      @sample.update(rent: current_user[:name] )
      #render plain: @sample[:ロケーション] #パラメーターをテキストで画面表示用

      set_resume#履歴用

      flash[:already] = "貸出処理が完了しました。"
      render :done_move_one
    end

  end


  #複数移動結果表示
  def done_move
    @sample = Sample.find(params[:sample_id]) 
    #(idはすでに渡されている)
    no = @sample[:申込番号] #[]を使ってカラムを指定 

    @products = Sample.where(申込番号: no) #指定条件で複数取得

  end

  #単品移動結果表示
  def done_move_one
      @sample = Sample.find(params[:sample_id]) 
  end


  #貸出リスト
  def rent_list
    if current_user.group == "Inventory" ||
       current_user.group == "A-STUDIO" ||
       current_user.group == "C-STUDIO"

       @samples = Sample.where(rent: params[:rent])
       flash[:already] = "　#{params[:rent]}【貸出中一覧】"
    
    else
    #自分の貸出確認専用
    @samples = Sample.where(rent: current_user[:name]) 
    flash[:already] = "　#{current_user[:name]}【貸出中一覧】"
    end

  end


  private

  def sample_params
    params.require(:sample).permit(:基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :カラー, :ロケーション, :rent )
  end

  def set_sample
    @sample = Sample.find(params[:id]) 
  end

  def set_resume
    resume = Resume.new(
      user_id: current_user[:id],
      sample_id: @sample.id,
      ロケーション旧: @old_loc,#ロケ更新前に取得
      ロケーション新: @sample.ロケーション,
      name: current_user[:name],
      group: current_user[:group] )    
      resume.save
  end

end
