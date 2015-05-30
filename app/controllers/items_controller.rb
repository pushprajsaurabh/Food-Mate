class ItemsController < SessionsController
  def get_items
    items_object = ItemsService.new
    items = items_object.generate_random_items
    has_new_match = User.find(@user_id).detect_and_update_match
    render :json => {:payload => items, :has_new_match => has_new_match, :meta => { :count => items ? items.count : 0 }}, :status => 200
  end

  def like_item
    if params[:item_id].blank?
      render :json => {:message => "item_id parameter missing!"}, :status => 400
      return
    end
    items_object = ItemsService.new(params, @user_id)
    begin
    new_match = items_object.item_liked
    rescue => e
      render :json => { :message => e.message }, :status => 400
      return
    end
    render :json => { :has_new_match => new_match, :message => "Success!!" }, :status => 200
  end
end
