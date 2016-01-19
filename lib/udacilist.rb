class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    if options[:title] then
      @title = options[:title]
    else
      @title = "Untitled List"
    end
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      # This is where the error handler will go
    end
  end
  def delete(index)
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
