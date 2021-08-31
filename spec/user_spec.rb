require 'rails_helper'
# describe ⇨何について仕様を記述しようとしているのか
# context →テストの内容を状況・状態のバリエーションごとに分類するために利用する
describe User, type: :model do
  describe '#create' do
    it "username、email、passwordがある場合、有効であること" do
      user = User.new(
        username: "yuya",
        email: "yuya@test.com",
        password: "yuyayuya",
      )
      expect(user).to be_valid
    end
    it "emailが無い場合、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya1",
        email: nil,
        password: "yuyayuya1"
      )
      user.valid?
      #expect(user.errors[:name]).to include("が入力されていません。")
    end
    it "passwordが無い場合、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya2",
        email: "yuya2@test.com",
        password: nil
      )
      user.valid?
      #expect(user.errors[:name]).to include("が入力されていません。")
    end
    it "passwordが6文字以上出ないと、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya3",
        email: "yuya3@test.com",
        password: "yuya3"
      )
      user.valid?
    end
    it "emailに@が入っていないと、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya4",
        email: "yuya4test.com",
        password: "yuyayuya4"
      )
      user.valid?
    end
  end
end

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
          
          # is_expected.to eq 200    
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