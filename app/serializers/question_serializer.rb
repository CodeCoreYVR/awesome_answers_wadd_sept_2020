class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at, :view_count, :like_count

  def like_count
    object.likes.count
  end

  belongs_to :user, key: :author
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :full_name
  end

  has_many :answers

  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :body, :created_at, :updated_at, :author_full_name
      def author_full_name
        object.user&.full_name
      end
  end

end



# This was generated using the command: 'rails g serializer question'
