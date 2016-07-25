module ApplicationHelper

  def humanize(secs)
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
    if secs > 0
      secs, n = secs.divmod(count)
      "#{n.to_i} #{name}"
    end
    }.compact.reverse.join(' ')
  end

  def top_ten_reigns
    top_ten = Reign.where.not(duration: nil).order(duration: :desc).limit(10)
  end

end
