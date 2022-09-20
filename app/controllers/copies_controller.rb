class CopiesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.create(copy_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    @copy.destroy
    redirect_to book_path(@book), status: :see_other
  end

  def edit
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @copy = @book.copies.find(params[:id])

    if @copy.update(copy_params)
      redirect_to @copy
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def copy_params
    params.require(:copy).permit(:borrower, :due_date)
  end
end
