require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'コメントが入力されていないとき' do
    comment = build(:comment, body: "")
    comment.valid?
    expect(comment.errors[:body]).to include("を入力してください")
  end
end
