require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードがある場合、有効" do
    user = User.new(
      username: "yuya",
      email: "yuya@test.com",
      password: "yuyayuya",
    )
    expect(user).to be_valid
  end
  it "メールアドレスがない場合、無効" do
    # user = User.new(
    #   username: "kakaki",
    #   email: nil,
    #   password: "ayuyayuya",
    # )
    # user.valid?
    # expect(user.errors[:email]).to include("を入力してください")
  end
  it "パスワードがない場合、無効" do
    # user = User.new(
    #   username: "kaka",
    #   email: "aysad@test.com",
    #   password: nil,
    # )
    # user.valid?
    # expect(user.errors[:username]).to include("を入力してください")
  end
  it "パスワード枠２つに同じ入力がされていると、無効"
  it "パスワード枠に６文字以上入力されていないと、無効"
  it "メールアドレスに＠を入れない場合、無効"

end