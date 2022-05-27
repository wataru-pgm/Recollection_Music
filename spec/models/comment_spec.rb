require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'コメントが4文字以下のときNG' do
    comment = build(:comment, body: "コメント")
    comment.valid?
    expect(comment.errors[:body]).to include("は5文字以上で入力してください")
  end

  it 'コメントが101文字以上のときNG' do
    comment = build(:comment,
                    body: "テストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテストほげテ")
    comment.valid?
    expect(comment.errors[:body]).to include("は100文字以内で入力してください")
  end
end
