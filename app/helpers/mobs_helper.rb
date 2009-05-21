module MobsHelper
  def get_nanos(mob)
    list = []
    mob.nanos.each do |nano|
      list.push(link_to nano.name, 'http://www.auno.org/ao/db.php?id=' + nano.url)
    end
    return list.collect { |nano| nano }.join(", ")
  end
end
