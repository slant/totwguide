module ItemsHelper
  def mob_list(item)
    list = []
    item.mobs.each do |mob|
      list.push(link_to mob.name, :controller => 'mobs', :action => 'show', :id => mob.id)
    end
    return list.collect { |mob| mob }.join(", ")
  end
end
