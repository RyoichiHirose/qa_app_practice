class Admin::QuestionsController < ApplicationController
  before_action:login_required
  before_action:admin_login_required
  
  def index
    @questions=Question.all
  end
  
  def destroy
    @question=Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path,notice:"質問「#{@question.title}」を削除しました"
  end

end
