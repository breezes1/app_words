class Wordbooks::WordsController < ApplicationController
  before_action :set_wordbook
  before_action :set_word, only: %i[ show edit update destroy mastered unmastered ]
  before_action :valid_wordbook_kind!, only: %i[ new edit create update destroy ]

  def index
    keyword = params[:keyword]
    @wordbooks_words = if keyword.present?
                         @wordbook.words.where('name LIKE :keyword or alternate_spelling LIKE :keyword ormeaning LIKE :keyword', keyword: "%#{keyword}%")
                       else
                         @wordbook.words
                       end

    user_words = current_user.user_words.where(word: @wordbooks_words)
    # 通过单词的最后复习时间排序，如果没有复习过则排在最后
    @wordbooks_words = if params[:sort] == 'last_reviewed_at'
      @wordbooks_words.left_joins(:user_words).order(Arel.sql 'user_words.last_reviewed_at IS NULL, user_words.last_reviewed_at DESC')
    else
      @wordbooks_words.left_joins(:user_words).order(Arel.sql 'user_words.last_reviewed_at IS NULL, user_words.last_reviewed_at DESC')
    end
    @pagy, @wordbooks_words = pagy(@wordbooks_words)
  end

  def show
  end

  def new
    @wordbook_word = Word.new
  end

  def edit
  end

  def create
    @word = current_user.words.build(wordbooks_word_params)

    respond_to do |format|
      if @word.save && @wordbook.words << @word
        format.html { redirect_to url_for(action: :index), alert: "Word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Word was failed to create." }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @wordbook_word.update(wordbooks_word_params)
        format.html { redirect_to url_for(action: :index), notice: "Word was successfully updated." }
        format.json { render :show, status: :ok, location: @wordbook_word }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Word was failed to update." }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wordbook_word.destroy!

    respond_to do |format|
      format.html { redirect_to wordbooks_words_url, notice: "Word was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def mastered
    user_word = current_user.user_words.find_or_create_by!(word: @wordbook_word)
    if user_word.update(mastered: true)
      flash[:notice] = "Word was successfully marked as mastered."
    else
      flash[:alert] = "Failed to mark word as mastered."
    end

    redirect_to url_for(action: :index)
  end

  def unmastered
    user_word = current_user.user_words.find_or_create_by!(word: @wordbook_word)
    if user_word.update(mastered: false)
      flash[:notice] = "Word was successfully marked as unmastered."
    else
      flash[:alert] = "Failed to mark word as unmastered."
    end

    redirect_to url_for(action: :index)
  end

  private
    def set_wordbook
      @wordbook = WordBook.find(params[:word_book_id])
    end

    def set_word
      @wordbook_word = @wordbook.words.find(params[:id])
    end

    def wordbooks_word_params
      params.require(:word).permit(:name, :alternate_spelling, :meaning, :sentence, :phonetic)
    end

    def valid_wordbook_kind!
      if @wordbook.system?
        flash[:notice] = "System word book can't be edited."
        redirect_to url_for(action: :index)
      end
    end
end
