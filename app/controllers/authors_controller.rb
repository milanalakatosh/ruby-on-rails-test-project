class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path, status: :see_other
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name, :email)
    end
end
