require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前が入力されていないとき' do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスが入力されていないとき' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'パスワードが入力されていないとき' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("は3文字以上で入力してください")
    end

    it 'パスワード確認が入力されていないとき' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it 'メールアドレスが重複している時' do
      create(:user, email: "test@example.com")
      user = build(:user, email: "test@example.com")
      user.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end
  end
end
