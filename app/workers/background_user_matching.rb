require 'matrix'
require 'tf-idf-similarity'
class BackgroundUserMatching
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(user_id)
    user_choices = UserChoice.find_by_user_id(user_id)
    if user_choices && user_choices.tags && user_choices.tags.split(',').size >= 10
      docs = []
      doc_hash = {}
      counter = 1
      doc_hash[counter.to_s] = user_choices.user_id
      docs.push(TfIdfSimilarity::Document.new(user_choices.tags))
      counter += 1
      rest_choices = UserChoice.where.not(user_id: user_id).each do |x|
        if x.tags.split(',').size >= 10
          doc_hash[counter.to_s] = x.user_id
          docs.push(TfIdfSimilarity::Document.new(x.tags))
          counter += 1
        end
      end
      # doc_hash.each { |name, value| instance_variable_set("@#{name}", value) }
      corpus = docs
      model = TfIdfSimilarity::TfIdfModel.new(corpus)
      matrix = model.similarity_matrix
      result_user_ids = {}
      delete_user_ids = []
      # matrix[0, model.document_index(document2)]
      for col in 1...matrix.column_size()
        u_id = doc_hash[(col+1).to_s]
        if matrix[0, col] > 0.3
          result_user_ids[u_id.to_s] = (matrix[0, col]*100).to_i
        else
          delete_user_ids.push(u_id)
        end
      end
      result_user_ids.each do  |key, value| 
         if UserFriend.where(:user_id => user_id, :friend_id => key).count > 0
            UserFriend.where(:user_id => user_id, :friend_id => key).first.update_attributes(:percentage => value, :is_new_match => true)
         else
            UserFriend.create(:user_id => user_id, :friend_id => key, :percentage => value, :is_new_match => true)
         end
      end
      UserFriend.where(:user_id => user_id, :friend_id => delete_user_ids).delete_all
      # BackgroundImageProcessor.perform_async(user_id)

      # document_1 = TfIdfSimilarity::Document.new("Lorem ipsum dolor sit amet...")
      # document_2 = TfIdfSimilarity::Document.new("Pellentesque sed ipsum dui...")
      # document3 = TfIdfSimilarity::Document.new("Nam scelerisque dui sed leo...")
      # corpus = [document1, document2, document3]
    end
  end

end