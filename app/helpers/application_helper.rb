# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def item_image_link(item_ref,image)
    link_to (image_tag '/images/items/' + image.to_s + '.gif'), 'http://auno.org/ao/db.php?id=' + item_ref.to_s
  end
  def display_if_admin
    if logged_in? && current_account.admin == true
      yield
    end
  end
end
