class QuestionMailer < ApplicationMailer
  def send_mail(user,question)
    @user = user
    @question = question
    mail(subject: '質問がありました',to: user.email, from: "test@example.com")
  end 
  
  def self.send_mail_users(current_user,question)
    @users = User.where.not(id:"#{current_user.id}")
    #@usersに質問者以外のユーザーを代入
    @users.each do |user|
      QuestionMailer.send_mail(user,question).deliver_now
      #userに対してquestionに関するメールを送信
    end 
  end
  

end

