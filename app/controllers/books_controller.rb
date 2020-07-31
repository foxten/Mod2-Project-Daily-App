class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :add_a_book, :remove_from_my_shelf, :destroy]
    
    def index
        @books = Book.all
    end

    def show
    end

    def new

        @book = Book.new
    end
    
    def create
        @book = Book.find_or_create_by(book_params)
        if @book.valid?
            UserBook.create(book_id: @book.id, user_id: @current_user.id)
            redirect_to @book
        else
            flash[:errors] = @book.errors.full_messages
            render new_book_path
        end
    end

    def edit
    end

    def update
        @book.update(book_params)
        if @book.save
            redirect_to @book
        else
            redirect_to edit_book_path
        end
    end
    
    def add_a_book
        UserBook.create(book_id: @book.id, user_id: @current_user.id)
        redirect_to user_profile_path
    end

    def remove_from_my_shelf
        @book.one_less_shelf(@current_user)
        redirect_to user_profile_path
    end

    def destroy
        @book.destroy
        redirect_to user_profile_path
    end


    private
    def find_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :genre, :author, :release_date)
    end
end
