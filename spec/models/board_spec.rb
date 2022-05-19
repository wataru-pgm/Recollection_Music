require 'rails_helper'

RSpec.describe Board, type: :model do
  it '想い出のタイトルが入力されていないとき' do
    board = build(:board, title: "")
    board.valid?
    expect(board.errors[:title]).to include("を入力してください")
  end

  it '思い出の内容が入力されていないとき' do
    board = build(:board, body: "")
    board.valid?
    expect(board.errors[:body]).to include("を入力してください")
  end

  it '想い出に当時の年齢が入力されていないとき' do
    board = build(:board, how_old: "")
    board.valid?
    expect(board.errors[:how_old]).to include("は数値で入力してください")
  end

  it ''
end