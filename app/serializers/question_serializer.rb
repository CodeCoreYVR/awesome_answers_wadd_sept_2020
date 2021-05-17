class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at, :view_count, :like_count

  def like_count
    object.likes.count
  end

end



# This was generated using the command: 'rails g serializer question'
