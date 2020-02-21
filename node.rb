class Node
  include Comparable
  attr_accessor :data, :left_child, :right_child

  def initialize
    @data = nil
    @left_child = nil
    @right_child = nil
  end

  def value(data=nil)
    @data = data
  end

  def left(node)
    @left_child = node
  end

  def right(node)
    @right_child = node
  end

  def is_leaf?
    self.left_child.nil? && self.right_child.nil?
  end

  def has_right_child?
    !self.right_child.nil?
  end

  def has_left_child?
    !self.left_child.nil?
  end

  def one_child?
    (self.left.nil? || self.right.nil?) && self.is_leaf?
  end

  def <=>(node)
    if node.is_a? Node
      @data <=> node.data
    else
      data <=> node
    end
  end
end
