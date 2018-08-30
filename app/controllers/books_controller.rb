class BooksController < ApplicationController
  before_action :authenticate_user!
  # このコントローラを実行する前に、ログイン認証がされていなければrootパスへリダイレクトする

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
    @book = Book.new  # 空のモデルをviewへ渡す
  end

  def create
    @book = Book.new(book_params)    # 下のストロングパラメータにtitleとopinionを渡して返してもらう
    @book.user_id = current_user.id # 現在のユーザーであることを示す必要がある
    if @book.save    # 値をデータベースに保存する
      puts @book.errors.full_messages # 書くことでエラーをターミナルに表示させる
      redirect_to book_path(@book) , notice: 'successfully' #行き先のコントローラ名_path(?????不明) bookにidが入っている　(book)はidもタイトルも全部含んでいる
    else #値が空欄だったらエラーメッセージ出す
      @books = Book.all
      render :index #こっちでやる #render:action名　で　同じコントローラ内の別のアクションのviewを呼び出す
    end
  end

  def edit
    @bookf = Book.find(params[:id]) #さきにこれを定義
    #URLを入力しても他の投稿者が投稿した編集画面(edit)に遷移できないように制限する
    if @bookf.user.id != current_user.id
      @book = Book.new
      render :show #redirect_to user_path(user_id) #users-showへ
    end
  end

  def show
    @book = Book.new
    @bookf = Book.find(params[:id])  # urlのidを取得する
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id) , notice: 'successfully'
     # コピペ viewないのでredirect
  end

  def destroy
    book = Book.find(params[:id]) # レコードを１件取得
    # resourcesルーティングのdestroyで渡ってきたパラメータ(params[:id])を元に、
    # 削除するレコードをfindで探しインスタンス変数@bookに渡す
    book.destroy # その変数@bookをdestroyメソッドでDBから削除
    redirect_to books_path #books-indexへリダイレクト destroyのviewなんてないので必ずredirect
  end

  private

  def book_params
      params.require(:book).permit(:title, :opinion)   # 値を受け取って取り出し、book_paramsとして返す
  end

end
