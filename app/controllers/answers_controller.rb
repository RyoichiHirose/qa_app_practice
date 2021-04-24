class AnswersController < ApplicationController

  def create
    @question=Question.find(params[:answer][:question_id])
    @answer=Answer.new(answer_params.merge(user_id:current_user.id,question_id:@question.id))
    if @answer.save
      flash[:notice]="質問「#{@question.title}に回答しました。」"
      redirect_to questions_path
    else
      flash[:danger]="回答が無効です"
      redirect_to "/questions/#{@question.id}"
    end
  end
  
  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
