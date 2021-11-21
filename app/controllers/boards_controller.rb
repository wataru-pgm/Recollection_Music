class BoardsController < ApplicationController
  def top
  end

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create

  end

  def show
  end

  def update

  end

  def destroy

  end
end
