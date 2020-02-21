class Tree
  require 'json'
  attr_accessor :root, :string

  def initialize(array)
    @array = array
  end
  
  def build_tree2
    # Root is the head of the linked list
    root = Node.new
    root.value(@array[0])
    

    @array.each do |element|
      next if (element == @array[0])
      compare_node = root
      leaf = false
      child = Node.new
      child.value(element)

      while !leaf
        if child > compare_node
          if (compare_node.has_right_child?)
            compare_node = compare_node.right_child
          else
            compare_node.rs_node(child)
            leaf = true  
          end
        elsif child < compare_node
          if (compare_node.has_left_child?)
            compare_node = compare_node.left_child 
          else
            compare_node.ls_node(child)
            leaf = true  
          end
        else
            break
        end
      end
    end
    puts root.inspect
    return root
  end

  def build_tree(array)
    # First sort the array and remove duplicates
    array_copy = array.clone
    if !(array_copy.uniq! == nil)
      array = array.sort!.uniq!
    end
    
    len = array.length
    mid_point = (len)/2

    n = array[mid_point]
    temp_child = Node.new
    temp_child.value(n)

    left = array[0..mid_point]
    right = array[mid_point..-1]

    # Initial root case
    if (defined? @root) == nil
      @root = temp_child
    end

    # Base case
    if len >= 2
      if @root > temp_child
        @root.left(temp_child)
        return
      else
        @root.right(temp_child)
        return
      end
    end
    # Finish building left branches first
    build_tree(left)
    build_tree(right)
  end

  def to_s(node)
    current = node
    if (defined? @string) == nil
      @string = "#{current.data}"
    end

    if current.is_leaf?
      return "#{current.data}"
    elsif current.has_left_child?
      if current.has_right_child?
        @string += "-> #{to_s(current.right_child)}"
      end
      @string += ", #{current.data}-> #{to_s(current.left_child)} "
    end
  end
  
end
