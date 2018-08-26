class UsersController < ApplicationController
  def index
    @book = Book.new
  end

  def create

  end

  def new
    @book = Book.new  # 空のモデルをviewへ渡す
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    # ユーザーのデータ１件を取得しインスタンス変数に渡す
    @books = @user.books.reverse_order
    # pageメソッドで全ての投稿画像が表示されないように
  end

  def update
  end

  def destroy
  end
end
