class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next == nil
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def size
    current_element = @head
    number_of_elements = 0
    while current_element != nil
      number_of_elements += 1
      current_element = current_element.next
    end
    number_of_elements
  end
  
  def empty?
    size == 0
  end

  def push(value)
    @head = Element.new(value, @head)
  end

  def peek
    if @head == nil
      nil
    else
      @head.datum
    end
  end

  def pop
    value = @head.datum
    @head = @head.next
    value
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(array)
    resulting_list = SimpleLinkedList.new
    if array != nil
      array.reverse.each { |value| resulting_list.push(value) }
    end
    resulting_list
  end

  def to_a
    values = []
    current_element = @head
    while current_element != nil
      values << current_element.datum
      current_element = current_element.next
    end
    values
  end
end