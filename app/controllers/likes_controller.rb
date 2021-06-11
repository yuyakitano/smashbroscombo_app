class LikesController < ApplicationController
  before_action :set_variables
  #・Userモデルの呼び出しをcurrent_userで行うことで、
  #自動的にuser_idにcurrent_user.idが指定されます。
  #・set_variablesで変数を定義しています。@id_nameは非同期の時に使います。


  def like
    like = current_user.likes.new(combo_id: @combo.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(combo_id: @combo.id)
    like.destroy
  end

  private

  def set_variables
    @combo = Combo.find(params[:combo_id])
    @id_name = "#like-link-#{@combo.id}"
  end
end
