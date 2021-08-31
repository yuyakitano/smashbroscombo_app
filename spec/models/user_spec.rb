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
