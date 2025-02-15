class BooksController < ApplicationController

 def index
  @books = Book.all
  @book = Book.new
  
 end

 def create
  @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :index
    end
 end

 def show
  @book = Book.find(params[:id])
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
  @book = Book.find(params[:id])
    if  @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
   else
      render :edit
   end
 end

 def destroy
  book = Book.find(params[:id])

  if  book.destroy(book_params)
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
 else
    render :index
 end
end


 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
