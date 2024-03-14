class WordbooksController < ApplicationController
  def index
    @pagy, @wordbooks = pagy(WordBook.includes(:words))
  end

  # def create
  # end

  # def destroy
  # end
end
