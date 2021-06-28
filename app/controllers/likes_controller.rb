class LikesController < ApplicationController
  before_action :set_variables
  #・Userモデルの呼び出しをcurrent_userで行うことで、
  #自動的にuser_idにcurrent_user.idが指定されます。
  #・set_variablesで変数を定義しています。@id_nameは非同期の時に使います。

  #いいね機能の実装①
  # def like
  #   like = current_user.likes.new(combo_id: @combo.id)
  #   like.save
  # end
  # def unlike
  #   like = current_user.likes.find_by(combo_id: @combo.id)
  #   like.destroy
  # end
 
  #いいね機能の実装②
  def like
    Like.create(user_id: current_user.id, combo_id: params[:id])
  end
  def unlike
    Like.find_by(user_id: current_user.id, combo_id: params[:id]).destroy

  end

  private
  def set_variables
    #いいね機能①②共通メソッド
    @combo = Combo.find(params[:id])
    #いいね機能の実装①
    @id_name = "#like-link-#{@combo.id}"
  end
end
