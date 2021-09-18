require 'rails_helper'
# describe ⇨何について仕様を記述しようとしているのか
# context →テストの内容を状況・状態のバリエーションごとに分類するために利用する
RSpec.describe User, type: :model do
  describe '#create' do
    it "username、email、passwordがある場合、有効であること" do
      user = User.new(
        username: "yuya",
        email: "yuya@test.com",
        password: "yuyayuya",
      )
      #user.valid?
      #expect(user)で「userの中に入れたものが今どうゆう状態かをチェック」
      #be_validで「expect().toの状態が有効であるという意味になる」
      expect(user).to be_valid
    end
    it "usernameがない場合無効であること" do
      user = User.new(
        username: nil,
        email: "yuya1@test.com",
        password: "yuyayuya1"
      )
      user.valid?
      #valid ?を使ってエラー検証を行えるようにする
      #valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれます。
      #今回は[:username]のエラーがみたいのでexpect()内部で指定してあげます。
      #今回は"が入力されていません"というエラーを含んでいる(include)しているエラーのはずという記述になります。複数含む場合ももちろんあります。
      expect(user.errors[:username]).to include("を入力してください。")
    end

    it "emailが無い場合、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya2",
        email: nil,
        password: "yuyayuya2"
      )
      user.valid?
      #valid ?を使ってエラー検証を行えるようにする
      #valid?メソッドでfalseであれば、user.errosでどんなerrorを持っているか返してくれます。
      #今回は[:email]のエラーがみたいのでexpect()内部で指定してあげます。
      #今回は"が入力されていません"というエラーを含んでいる(include)しているエラーのはずという記述になります。複数含む場合ももちろんあります。
      expect(user.errors[:email]).to include("を入力してください。")
    end
    it "passwordが無い場合、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya3",
        email: "yuya3@test.com",
        password: nil
      )
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end
    it "passwordが6文字以上出ないと、無効であること" do
      #user = build(:user, email: nil)
      user = User.new(
        username: "yuya4",
        email: "yuya4@test.com",
        password: "yuya4"
      )
      user.valid?
      expect(user.errors[:password]).to include("は６文字以上に設定してください。")
    end
  end

end
