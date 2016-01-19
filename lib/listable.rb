module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(options = {})
    if options[:due] then
      dates = options[:due].strftime("%D")
    elsif options[:start_date]
      dates = options[:start_date].strftime("%D")
      if options[:end_date] then
        dates << " -- " + options[:end_date].strftime("%D")
      end
    else
      dates = "N/A"
    end
    return dates
  end

  def format_priority()
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end
end
