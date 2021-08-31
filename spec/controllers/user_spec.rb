require 'rails_helper'
# describe ⇨何について仕様を記述しようとしているのか
# context →テストの内容を状況・状態のバリエーションごとに分類するために利用する

describe User, type: :controller do
  describe 'アクセス制限機能' do
    describe '#edit' do
      subject { get edit_user_path }
      context 'ユーザーAがログインしている時' do
        before do
          # user = User.new(
          #   username: "ユーザーA",
          #   email: "a@example.com",
          #   password: "password"
          # )
          user_a = FactoryBot.create(:user, 
            username: 'ユーザーA', 
            email: 'a@example.com',
            password: 'password'
          )
          sign_in user 
        end
        
        it "自身のデータのedit操作が有効であること" do
          is_expected.to eq 200    
        end
  
      end      


    end
    describe '#update' do
      it "ログイン中のユーザーがcurrent_userの場合、有効であること"
      it "ログインしていない場合、無効であること(authenticate_user!)"
      it "ログイン中のユーザーがcurrent_userでない場合、無効であること(ensure_current_user)"



    end  
    describe '#destroy' do
      it "ログイン中のユーザーがcurrent_userの場合、有効であること" 
      it "ログインしていない場合、無効であること(authenticate_user!)" 
      it "ログイン中のユーザーがcurrent_userでない場合、無効であること(ensure_current_user)" 

    end    
  end
end