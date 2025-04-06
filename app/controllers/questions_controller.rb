class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # p @questions
  end

  # 質問詳細ページ表示
  def show
    @question = Question.find(params[:id])
    # p @question
  end

  # 質問作成
  def new
    # Questionﾓﾃﾞﾙのｲﾝｽﾀﾝｽを新規作成。ｲﾝｽﾀﾝｽ変数に渡す
    @question = Question.new
  end

  # 質問登録
  def create
    # p params
    # p question_params

    # Questionﾓﾃﾞﾙ初期化 newﾒｿｯﾄﾞのquestion_paramsの値を渡す事でﾓﾃﾞﾙに値ｾｯﾄできる
    @question = Question.new(question_params)
    # QuestionﾓﾃﾞﾙをDBへ保存
    if @question.save
      # showリダイレクト
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # 質問編集
  # IDを元に該当のQuestionのﾚｺｰﾄﾞをDBから取得。ｲﾝｽﾀﾝｽ変数に代入しViewに渡す
  def edit
    @question = Question.find(params[:id])
  end

  # 質問更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # 質問削除
  # 削除したいﾚｺｰﾄﾞをIDで検索しｲﾝｽﾀﾝｽ変数に代入。削除。質問一覧に遷移
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  # class内からのみ使用可能なメソッドprivate
  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end

end
