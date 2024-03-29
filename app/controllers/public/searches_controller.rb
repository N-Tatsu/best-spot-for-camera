class Public::SearchesController < ApplicationController
  
  before_action :authenticate_user!

  def search
      @content = params[:content]
      @model = params[:model]
      @method = params[:method]
  
      #選択した[model]、[method]、入力した内容を検索し、検索結果を@recordsに代入する
      if @model == "user"
          @records = User.search_for(@content, @method)
      else
          @tags = Tag.search_for(@content, @method)
          @records = [ ]
          @tags.each do |tag|
          @records.concat(tag.post_images)
        end
      end
  end

end
