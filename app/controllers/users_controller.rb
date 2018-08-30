class UsersController < ApplicationController
  before_action :authenticate_user!
  # このコントローラを実行する前に、ログイン認証がされていなければrootパスへリダイレクトする

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    # よくわからないのでshowのをコピペ
  end

  def create

  end

  def new

  end

  def edit
    @user = User.find(params[:id])
    #@users = User.all
  end

  def show
    @user = User.find(params[:id])# ユーザーのデータ１件を取得しインスタンス変数に渡す
                                  # paramsはストロングパラメータとは関係ない
    @books = @user.books.reverse_order  # ????
    @book = Book.new    # bookモデルの空の箱を定義する　次はbookのviewファイルへ
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) # ストロングパラメータで限られたものだけ持ってくる
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :intro) #モデルにattachmentメソッドを追記した際に追記した
  end

end
