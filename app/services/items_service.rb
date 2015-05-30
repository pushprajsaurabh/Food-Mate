class ItemsService
  def initialize(params = nil, user_id = nil)
    @params = params
    @user_id = user_id
  end   

  def generate_random_items
    collections = Collection.order('RANDOM()').limit(ENV['TOTAL_DISTINCT_COLLECTIONS'])
    items = collections.map do |col|
              col.items.order('RANDOM()').limit(ENV['ITEMS_PER_COLLECTION']).map do |item|
                item.to_item_hash
              end
            end
    return items.flatten!
  end

  def item_liked
    begin
      item = Item.find(params[:item_id].to_i)
    rescue
      raise StandardError.new('Item not found against the item_id')
    end
    choice = UserChoice.find_or_create_by(:user_id => user_id)
    chosen_item_ids = choice.item_ids + ',' rescue ''
    item_ids_unsorted = chosen_item_ids.to_s + params[:item_id].to_s
    choice.item_ids = item_ids_unsorted.split(",").uniq.sort.map { |str| "#{str}" }.join(',')
    chosen_tags = choice.tags + ',' rescue ''
    tags_unsorted = chosen_tags.to_s + item.tags.pluck(:name).map {|str| "#{str}"}.join(',')
    choice.tags = tags_unsorted.split(",").uniq.sort.map { |str| "#{str}" }.join(',')
    choice.save
    BackgroundUserMatching.perform_async(@user_id)
    has_new_match = User.find(user_id).detect_match
    return has_new_match
  end

  private
  attr_reader :params, :user_id
end