class Admin::CombosController < ApplicationController
  #before_action :authenticate_admin_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # only: [:new, :create, :edit, :update, :destroy ]
  

  def index
    @q = Combo.ransack(params[:q])
    @combos = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)
    @users = User.all 
    @fighter = Fighter.all
    @genre = Genre.all
    

    # サイドバー等に表示するいいね数ランキング機能（TOP３まで）
      # Likeテーブル内のcombo_idが同じものにグループを分け、それを番号の多い順に並び替える、
      # limit(3)で表示する最大数を3個に指定、pluckで:combo_idカラムのみを数字で取り出す。
      # Combo.find()でplackで取り出された数字をcombo_idとしていいね数順にcomboを取得できる。
    @all_like_ranks = Combo.find(Like.group(:combo_id).order('count(combo_id) desc').limit(3).pluck(:combo_id))
    from  = Time.current.at_beginning_of_day
    to    = (from + 6.day).at_end_of_day
    
    #@weekly_like_ranks = Combo.joins(:likes).where(likes: { created_at:0.days.ago.beginning_of_week..0.days.ago.next_week}).group(:id).order("count(*) desc").limit(5)
    @weekly_like_ranks = Combo.joins(:likes).where(likes: { created_at: from...to}).group(:id).order("count(*) desc").limit(5)
    @monthly_like_ranks = Combo.joins(:likes).where(likes: { created_at:0.days.ago.beginning_of_month..0.days.ago.end_of_month}).group(:id).order("count(*) desc").limit(5)
    @yearly_like_ranks = Combo.joins(:likes).where(likes: { created_at:0.days.ago.beginning_of_year..0.days.ago.end_of_year}).group(:id).order("count(*) desc").limit(5)

    # いいね順ソート機能①実装中(侍にて質問中)
    # if params[:q].present?
    #   # 検索フォームからアクセスした時の処理
    #     @search = Combo.ransack(search_params)
    #     @combos = @search.result
    #   else
    #   # 検索フォーム以外からアクセスした時の処理
    #     params[:q] = { sorts: 'id desc' }
    #     @search = Combo.ransack()
    #     @combos = Combo.all
    #   end
    # @likes = Like.all

    #@search = Combo.ransack(params[:q])

    #いいね順のソート機能②実装中(侍にて質問中)
    #@q = Combo.ransack(params[:q])
    #@combos = @q.result(distinct: true)
    #@combos = Combo.joins(:likes).group("likes.combo_id").order("count(likes.id) desc")
  
    #@combos = Combo.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    
  end

  #ソートページに飛んでソートする場合
  # def search
  #   if params[:q].present?
  #   # 検索フォームからアクセスした時の処理
  #     @search = Combo.ransack(search_params)
  #     @combos = @search.result(distinct: true).page(params[:page])
  #     # @combos.likes_count + 1
  #   else
  #   # 検索フォーム以外からアクセスした時の処理
  #     params[:q] = { sorts: 'id desc' }
  #     @search = Combo.ransack()
  #     @combos = @search.result(distinct: true).page(params[:page])
  #     # @combos = Combo.all
  #     # @combos.likes_count + 1
  #   end
  # end

  # def search_params
  #   params.require(:q).permit(:sorts)
  #   # 他のパラメーターもここに入れる
  # end

  # def search_like_count
  #   combo.likes.count + 1
  # end

  def show
    @combo = Combo.find(params[:id])
    #@commands = ComboCommand.find([:id])
    #binding.pry
    #ComboCommand.find([:combo_id = @combo.id])
    #@commands = Command.find(params[:command_id])
    #@user = User.find_by(id: @combo.user_id)
    #@comments = @combo.comments
    @comment = Comment.new
    #コメントを新着順で取得
    @comments = @combo.comments.includes(:user)
    #@comments = @combo.comments.order(created_at: :desc)
    @fighters = Fighter.all
    @commands = Command.all


  end

  def new
    @combo = Combo.new
    #@commands = Command.all.map {|command| [command.name, command.commandid] }
    @commands = Command.all
    @combo_command = ComboCommand.new
    @fighter = Fighter.all
    @startposition = Startposition.all
    @genre = Genre.all
    @user = current_user.id
    @fighters = Fighter.all
    @fighter_target = ComboFighterTarget.new
  end

  def commandset
    #commandset = 
    #@commandset = Command.find(params[:id])
    #ComboCommand.create(id: params[:id])
    #render :combo_new
  end

  #投稿確認画面の実装
  # def confirm_new
  #   @combo = current_user.combos.new(combo_params)
  #   render :new unless @combo.valid?
  # end

  def create
    #binding.pry
    @combo = Combo.new(combo_params)
    @combo.user_id = current_user.id
    url = params[:combo][:youtube_url]
    url = url.split('/').last
    @combo.youtube_url = url
    # if params[:back].present?
    #   render :new
    #   return
    # end
    
    if @combo.save
      redirect_to combos_url, notice: "コンボ「#{@combo.name}」を登録しました。"  
    else
      @fighter = Fighter.all
      @commands = Command.all
      @startposition = Startposition.all
      @genre = Genre.all
      @fighters = Fighter.all
      render :new
      
    end
    #combo.save!
    #redirect_to combos_url, notice: "コンボ「#{combo.name}」を登録しました。"
    
   
  end




  def edit
    @combo = Combo.find(params[:id])
    @commands = Command.all
    #@combo_command = ComboCommand.new
    @fighter = Fighter.all
    @startposition = Startposition.all
    @genre = Genre.all
    @fighters = Fighter.all

  end

  def update
    @combo = Combo.find(params[:id])
    if @combo.update(combo_params)
      redirect_to combos_url, notice: "コンボデータ「#{@combo.name}」を更新しました。"  
    else
      @fighter = Fighter.all
      @commands = Command.all
      @startposition = Startposition.all
      @genre = Genre.all
      render :new
      
    end
  
  
  end

  def destroy
    combo = Combo.find(params[:id])
    combo.destroy
    redirect_to admin_combos_path, notice: "コンボデータ「#{combo.name}」を削除しました。"
  end

  private
  def combo_params
    params.require(:combo).permit(:name, :fighter_id, :damage_dealt, :genre_id, :startposition_id, :startpossibledamage_min, :startpossibledamage_max, :level, :user_id, :youtube_url, :message, command_ids:[], fighter_ids:[] )
  end
  #def set_current_user
  # @current_user = User.find_by(id: session[:user_id])
  #end
end