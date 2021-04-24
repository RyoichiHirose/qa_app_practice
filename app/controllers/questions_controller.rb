class QuestionsController < ApplicationController
  before_action:login_required
  before_action:correct_user,only:[:destroy,:edit,:update]
  def index
    @questions=Question.all
  end

  def show
    @question=Question.find(params[:id])
    @answers=@question.answers
    @answer=Answer.new
  end

  def new
    @question=Question.new
  end

  def edit
  end

  def create
    @question=current_user.questions.new(question_params)
    if @question.save
      redirect_to @question,notice:"質問「#{@question.title}」を投稿しました。"
    else
      render :new
    end
  end

  def update

    if @question.update(question_params)
      redirect_to @question,notice:"質問「#{@question.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
  
    @question.destroy
    redirect_to questions_url,notice:"質問「#{@question.title}」を削除しました。"
  end
  
  private

  def question_params
    params.require(:question).permit(:title,:content)
  end

  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    if @question.nil?
      flash[:danger]="権限がありません" 
      redirect_to root_url
    end
  end
end
