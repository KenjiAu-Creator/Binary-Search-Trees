class BinaryTree
  def initialize(root = nil)
    @root = root
  end

  def build_tree(arr)
    @root = insert_node(nil,arr.shift)
    arr.each {|value| insert_node(@root, value)}
  end

  def insert_node(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_node(node.left, value)
      node.left.parent = node
    elsif value > node.value
        node.right = insert_node(node.right, value)
        node.right.parent = node
    end

    return node
  end
end