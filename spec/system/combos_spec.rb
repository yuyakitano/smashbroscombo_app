require 'rails_helper'

describe 'コンボ機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, 
        username: 'ユーザーA', 
        email: 'a@example.com'
      )
      fighter_a = FactoryBot.create(:fighter, 
        name: 'マリオ'
      )
      genre_a = FactoryBot.create(:genre, 
        name: 'ダメージ用' 
      )
      startposition_a = FactoryBot.create(:startposition, 
        name: '地上'
      )
      FactoryBot.create(:combo, 
        name: "最初のコンボ",
        fighter: fighter_a,
        startpossibledamage_min: 1,
        startpossibledamage_max: 10,
        level: "easy",
        message: "",
        youtube_url: nil,
        damage_dealt: 20,
        genre: genre_a,
        startposition: startposition_a,
        user: user_a
      )
    end
    context 'ユーザーAがログインしている時' do
      before do
        # ユーザーAでログインする
        #visit main_path
        
        visit new_user_session_path
        # fill_in 'メールアドレス', with: 'a@example.com'
        # fill_in 'パスワード', with: 'password'
        # click_button 'ログイン'
      end
      it 'ユーザーAが作成したコンボが表示される' do
        # visit main_path
        # 作成したコンボが画面上に表示されていることを確認
      end
    end
  end
end