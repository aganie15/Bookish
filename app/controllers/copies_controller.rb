class CopiesController < ApplicationController
  before_action :find_book
  def create
    @copy = @book.copies.create(copy_params)
    redirect_to book_path(@book)
  end

  def new
    @copy = Copy.new
  end
  def destroy
    @copy = @book.copies.find(params[:id])
    @copy.destroy
    redirect_to book_path(@book), status: :see_other
  end

  def edit
    @copy = @book.copies.find(params[:id])
  end

  def update
    @copy = @book.copies.find(params[:id])

    if @copy.update(copy_params)
      redirect_to book_path(@book)
    else
      puts "Invalid input error"
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def copy_params
    params.require(:copy).permit(:borrower, :due_date)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
