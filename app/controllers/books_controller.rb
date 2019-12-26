class BooksController < ApplicationController

  def show
  	@book = Book.find(params[:id])
    @bookn = Book.new
    @user = current_user
  end

  def index
    @book = Book.new
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
  end

  def create
  	@book = Book.new(book_params) 
    @user =current_user#Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @book.user_id = @user.id
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to user_path(@user.id), notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  # def edit
  # 	@book = Book.find(params[:id])
  #   if @book.user_id != current_user.id
  #     redirect_to @book
  #   end
  # end
  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:success] ="error"
      redirect_to books_path
    end
  end


  def update
  	@book = Book.new(book_params)
  	if @book.update(book_params)
  		 redirect_to book_path(@book.id)
       flash[:success] = "successfully."
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render :edit
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
    if @book.user_id = current_user.id
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
    else
      render 'show'
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title,:body)
  end

end
