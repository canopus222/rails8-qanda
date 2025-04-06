class AnswersController < ApplicationController
  # 回答登録
  def create
    # p params # ﾌｫｰﾑからどんなﾃﾞｰﾀが送信されているか確認
    @question = Question.find(params[:question_id])
    # questionに紐づいたコメントのﾚｺｰﾄﾞをDBに保存する
    # createﾒｿｯﾄﾞを使う事でquestionに紐づいたanswerについて新しいﾚｺｰﾄﾞが作成されDBに保存される
    # answerのﾃﾞｰﾀはcreateﾒｿｯﾄﾞの引数に渡す
    @question.answers.create(answer_params)
    redirect_to question_path(@question) # 質問詳細ﾍﾟｰｼﾞに遷移
  end

  # 回答削除
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to @question, sutaus: :see_other
  end
  
  # ｽﾄﾛﾝｸﾞﾊﾟﾗﾒｰﾀｰで指定したカラムのみ受け入れるようにする
  private
  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
