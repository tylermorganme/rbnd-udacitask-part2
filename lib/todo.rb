class TodoItem
  include Listable
  attr_reader :description, :due, :priority
  @@priorities = ["high", "medium", "low"]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    if @@priorities.include?(options[:priority])
      @priority = options[:priority]
    else
      raise UdaciListErrors::InvalidPriorityValue,
        "#{options[:priority]} is not a valid priority, valid options are " +
        @@priorities.map{|priority|"'"+priority+"'"}.join(", ")
    end
  end
  def details
    [format_description(@description), "due: " +
    format_date(due: @due) +
    format_priority(@priority)]
  end
end
