class BooksController < ApplicationController
  def index   
    @books = Book.search(params[:search].split("?").last)
    respond_to :html, :json
  end

  def new
    @book=Book.new
  end

  def create    
    @book=Book.new(params[:book].to_unsafe_hash)
    @book.save
    redirect_to books_path
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @book.update(params[:book].to_unsafe_hash)
    redirect_to books_path
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def subscribe
    puts current_user.Name
    @book = params[:book]
    if Subscribtion.exists?(:User_id => current_user.id, :Book_id => @book)      
      @subb = Subscribtion.find(params[:Book_id => @book])
      put "Ok"
    else
      @subb=Subscribtion.create(:User_id => current_user.id,:Book_id => @book)
      @subb.save
      puts "No"
    end
    
    redirect_to books_path
  end

  def unsubscribe
    @book = params[:book]
    @book=Subscribtion.where(:User_id => current_user.id,:Book_id => @book).first
    @book.destroy
    puts "Success"    
    redirect_to books_path
  end
end
