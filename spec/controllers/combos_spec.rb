require 'rails_helper'

RSpec.describe CombosController, type: :controller do
  describe '新規投稿機能' do
    it "コンボ名・ファイター・コンボ開始位置・コンボジャンルを入力していれば有効" do
      combo = build(:combo)
      combo.valid?
      expect(combo).to be_valid

    end
    it "コンボ名・ファイター・コンボ開始位置・コンボジャンルを入力していれば有効" do
      combo = build(:combo, name: nil)
      combo.valid?
      expect(combo).not_to be_valid

    end
    # context 'ユーザーAがログインしている時' do
    #   # before do
    #   #   fighter = create(:fighter)
    #   #   genre = create(:genre)
    #   #   startposition = create(:startposition)
    #   #   user = create(:user)
    #   # end
    #   it "コンボ名・ファイター・コンボ開始位置・コンボジャンルを入力していれば有効" do
    #     combo = create(:combo)
    #     expect(combo).to be_valid

    #   end
    # end
  end
end