class CombosController < ApplicationController
  #before_action :authenticate_admin_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  def main
    @fighters = Fighter.all
    @fighter = Fighter.all
    @q = Combo.ransack(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    @combos = @q.result(distinct: true).page(params[:page])
    @genre = Genre.all
    
  end

  

  def index
    if params[:sort] == "like"
      #binding.pry
      @q = Combo.ransack(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
      #binding.pry
      @combos = @q.result(distinct: true).page(params[:page])
      #binding.pry
    else
      @q = Combo.ransack(params[:q])
      #binding.pry
      @combos = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)
      #binding.pry
    end


    # @q = Combo.ransack(params[:q])
    # @combos = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)
    @users = User.all 
    @fighter = Fighter.all
    @genre = Genre.all
    

    # サイドバー等に表示するいいね数ランキング機能（TOP３か5まで）
      # Likeテーブル内のcombo_idが同じものにグループを分け、それを番号の多い順に並び替える、
      # limit(3)で表示する最大数を3個に指定、pluckで:combo_idカラムのみを数字で取り出す。
      # Combo.find()でplackで取り出された数字をcombo_idとしていいね数順にcomboを取得できる。
    
    # to       = Time.current
    # week_from    = (to - 7.day)
    # month_from   = (to - 31.day)
    # year_from    = (to - 36.day)

    # if params[:rank] == "all"
    #   @like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    # elsif params[:rank] == "week"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:week_from...to}).group(:id).order("count(*) desc").limit(10)
    # elsif params[:rank] == "month"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:month_from...to}).group(:id).order("count(*) desc").limit(5)
    # elsif params[:rank] == "year"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:year_from...to}).group(:id).order("count(*) desc").limit(5)
    # else
    #   @like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    # end



    #render "combos/#{params[:name]}"
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

  def search
    @users = User.all 
    @fighter = Fighter.all
    @genre = Genre.all
    # サイドバー等に表示するいいね数ランキング機能（TOP３か5まで）
      # Likeテーブル内のcombo_idが同じものにグループを分け、それを番号の多い順に並び替える、
      # limit(3)で表示する最大数を3個に指定、pluckで:combo_idカラムのみを数字で取り出す。
      # Combo.find()でplackで取り出された数字をcombo_idとしていいね数順にcomboを取得できる。
    
    
    to       = Time.current
    week_from    = (to - 7.day)
    month_from   = (to - 31.day)
    year_from    = (to - 36.day)
    if params[:rank] == "all"
      @combos = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(30).pluck(:combo_id))
    elsif params[:rank] == "week"
      @combos = Combo.joins(:likes).where(likes: { created_at:week_from...to}).group(:id).order("count(*) desc").limit(30)
    elsif params[:rank] == "month"
      @combos = Combo.joins(:likes).where(likes: { created_at:month_from...to}).group(:id).order("count(*) desc").limit(30)
      # @combos = Combo.joins(:likes).where(likes: { created_at:0.days.ago.fbeginning_of_month..0.days.ago.end_of_month}).group(:id).order("count(*) desc").limit(30)
    elsif params[:rank] == "year"
      @combos = Combo.joins(:likes).where(likes: { created_at:year_from...to}).group(:id).order("count(*) desc").limit(30)
      # @combos = Combo.joins(:likes).where(likes: { created_at:0.days.ago.beginning_of_year..0.days.ago.end_of_year}).group(:id).order("count(*) desc").limit(30)
    else
      @combos = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(30).pluck(:combo_id))
    end

  end


  def search_fighter
    to       = Time.current
    week_from    = (to - 7.day)
    month_from   = (to - 31.day)
    year_from    = (to - 36.day)
    search_fighter_id = params[:search_fighter_id].to_i
    if params[:rank] == "all"
      like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(100).pluck(:combo_id))
    elsif params[:rank] == "week"
      like_ranks = Combo.joins(:likes).where(likes: { created_at:week_from...to}).group(:id).order("count(*) desc").limit(100)
    elsif params[:rank] == "month"
      like_ranks = Combo.joins(:likes).where(likes: { created_at:month_from...to}).group(:id).order("count(*) desc").limit(100)
    elsif params[:rank] == "year"
      like_ranks = Combo.joins(:likes).where(likes: { created_at:year_from...to}).group(:id).order("count(*) desc").limit(100)
    else
      like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(100).pluck(:combo_id))
    end
    @combos = like_ranks.select{ |combo| combo.fighter_id==search_fighter_id}
    # search_fighter_id = params[:search_fighter_id].to_i
    # combos = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    # @combos = combos.select{ |combo| combo.fighter_id==search_fighter_id}
    
    @users = User.all 
    @fighter = Fighter.all
    @genre = Genre.all
    @search_fighter = Fighter.find(fighter_id = params[:search_fighter_id])
    
    # サイドバー等に表示するいいね数ランキング機能（TOP３か5まで）
      # Likeテーブル内のcombo_idが同じものにグループを分け、それを番号の多い順に並び替える、
      # limit(3)で表示する最大数を3個に指定、pluckで:combo_idカラムのみを数字で取り出す。
      # Combo.find()でplackで取り出された数字をcombo_idとしていいね数順にcomboを取得できる。


    # if params[:rank] == "all"
    #   @like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    # elsif params[:rank] == "week"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:week_from...to}).group(:id).order("count(*) desc").limit(10)
    # elsif params[:rank] == "month"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:month_from...to}).group(:id).order("count(*) desc").limit(5)
    # elsif params[:rank] == "year"
    #   @like_ranks = Combo.joins(:likes).where(likes: { created_at:year_from...to}).group(:id).order("count(*) desc").limit(5)
    # else
    #   @like_ranks = Combo.find(Like.group(:combo_id).order("count(*) desc").limit(5).pluck(:combo_id))
    # end


  end
  def show
    @combo = Combo.find(params[:id])
    
    @users = User.all 
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

  #投稿確認画面の実装
  # def confirm_new
  #   @combo = current_user.combos.new(combo_params)
  #   render :new unless @combo.valid?
  # end

  def create
    
    
    @combo = Combo.new(combo_params)
    
    #コマンド配列作成
    command_ids1 = params[:combo][:commands11]
    command_ids2 = command_ids1.split(",")
    @combo.command_ids = command_ids2
    @combo.user_id = current_user.id

    #ユーチューブURL加工
    url = params[:combo][:youtube_url]
    url = url.split('/').last
    @combo.youtube_url = url
    # if params[:back].present?
    #   render :new
    #   return
    # end
    
    if @combo.save
      redirect_to combos_url, notice: "コンボ「#{@combo.name}」を登録しました。"  
      
      
      @combo.create_notification_following_post!(current_user)
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
    #コマンド配列作成
    # command_ids1 = params[:combo][:commands11]
    # command_ids2 = command_ids1.split(",")
    # @combo.command_ids = command_ids2
    #ユーチューブURL加工
    url = params[:combo][:youtube_url]
    url = url.split('/').last
    @combo.youtube_url = url
    if @combo.update(combo_params)
      command_ids1 = params[:combo][:commands11]
      command_ids2 = command_ids1.split(",")
      @combo.command_ids = command_ids2
      redirect_to combos_url, notice: "コンボデータ「#{@combo.name}」を更新しました。"  
    else
      @fighter = Fighter.all
      @commands = Command.all
      @startposition = Startposition.all
      @genre = Genre.all
      @fighters = Fighter.all
      render :new
    end
  
  
  end

  def destroy
    
    
    @combo = Combo.find(params[:id])
    
    
    @combo.destroy
    redirect_to combos_url, notice: "コンボデータ「#{@combo.name}」を削除しました。"
  end

  private
  def combo_params
    params.require(:combo).permit(:name, :fighter_id, :fighter_image, :damage_dealt, :genre_id, :startposition_id, :startpossibledamage_min, :startpossibledamage_max, :level, :user_id, :youtube_url, :message, command_ids:[], fighter_ids:[] )
  end
  #def set_current_user
  # @current_user = User.find_by(id: session[:user_id])
  #end
end