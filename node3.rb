class Node
  attr_accessor :value, :left, :right, :parent, :color
  include Comparable
  require 'json'

  def initialize(value=nil)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
    @color = "red"
  end

  def left_child(node)
    @left = node
  end

  def right_child(node)
    @right = node
  end

  def parent_node(node)
    @parent = node
  end
  
  def set_color(value)
    @color = value
  end

  def <=>(node)
    if node.is_a? Node
      @value <=> node.value
    else
      self.value <=> node
    end
  end

  def get_parent
    @parent
  end

  def get_grand_parent
    @parent.parent
  end

  def get_sibling(node=self)
    x = node.parent
    if x == nil
      return nil
    end

    if node == x.left
      return x.right
    else
      return x.left
    end
  end

  def get_uncle
    p = get_parent
    get_sibling(p)
  end

  def rotate_right
    x = @left
    # Creating root parent to new child relation
    if !(@parent.right.nil?)
      @parent.right = x
    end
    # Creating child to new parent relation
    start_parent = @parent
    @parent = x
    x.parent = start_parent

    if !(x.right.nil?)
      y = x.right 
      self.left = y
    end

    x.right = self
  end

  def rotate_right2
    if (self == @parent.right)
      @parent.right = @left
    elsif (self == @parent.left)
      @parent.left = @left
    end 
    @left.parent_node(@parent)
    @parent = @left
    @left = @left.right
    @parent.right = self
    
  end
  
  def rotate_left2
    if (self == @parent.left)
      @parent.left = @right
    elsif (self == @parent.right)
      @parent.right = @right
    end
    @right.parent = @parent
    @parent = @right
    @right = @right.left
    @parent.left = self
  end
  
  def rotate_left
    x = @right
    if !(@parent.nil?)
      @parent.left = x
    end

    # start_parent = @parent
    # @parent = x
    # x.parent = start_parent

    x.parent = @parent
    x.left_child(self)
    
    if !(x.left.nil?)
      y = x.left 
      self.right = y
    end
  end

  def flip_color
    if @color == "red"
      @color = "black"
    elsif @color == "black"
      @color = "red"
    else
      @color = nil
    end
  end

  def to_json(*args)
    if @left.nil?
      left_value = nil
    else
      left_value = @left.value
    end
    if @parent.nil?
      parent_value = nil
    else
      parent_value = @parent.value
    end
    if @right.nil?
      right_value = nil
    else
      right_value = @right.value
    end

    { 'value' => @value,
      'left' => left_value,
      'right' => right_value,
      'parent' => parent_value,
      'color' => @color,
    }.to_json(*args)
  end

end


