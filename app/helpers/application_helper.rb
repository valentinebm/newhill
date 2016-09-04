module ApplicationHelper

  def humanize(secs)
    [[60, :secs], [60, :mins], [24, :hours], [1000, :days]].map{ |count, name|
    if secs > 0
      secs, n = secs.divmod(count)
      "#{n.to_i} #{name}"
    end
    }.compact.reverse.join(' ')
  end

  def top_ten_by_duration
    User.where.not(total_reign: 0).order(total_reign: :desc).limit(10)
  end

  def top_ten_by_reign_number
    User.joins(:reigns)
        .where('reigns.finished is not null')
        .select('users.id, users.first_name, users.picture, users.gender, count(*) as reigns_count')
        .group(:id)
        .order("reigns_count desc")
        .limit(10)
  end

  def current_reign
    Reign.last
  end

end
