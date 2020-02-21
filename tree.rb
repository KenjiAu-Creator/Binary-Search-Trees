class Tree
  attr_accessor :root
=begin 
  Red-Black Tree Properties
    1. A node is either red of Black
    2. The root and leaves (NIL) are black.
    3. If a node is red, then its children are black
    4. All paths from a node to its NIL descendants contain the same number of black nodes. 
=end

  def initialize(array)
    @array = array
    @root = Node.new(nil)
  end
  
  def insert(val)
    y = Node.new(nil)
    z = Node.new(val)
    x = @root
    w = Node.new
    @root.parent_node(w)
    w.set_color("nil")

    while !(x == nil || x.value == nil)
      y = x
      if z < x
        x = x.left
      else
        x = x.right
      end
    end

    if(y.value == nil)
    
      @root = z
      @root.set_color("black")
      
    elsif z < y
      y.left_child(z)
      z.parent_node(y)

    elsif z > y
      y.right_child(z)
      z.parent_node(y)
    end

    if !(z == @root)
      rebalance(z)
    end

  end

  def rebalance(z)
    while (z.get_parent.color == "red" || @root.color == "red")
      # Make sure the grandparent exists. If it doesn't we are at the root or first tier.
      if !(z.get_parent.get_parent == nil)
        if z.parent == z.parent.parent.left
          if z == z.parent.left
            if !(z.get_uncle == nil)
              # If uncle exists
              if z.get_uncle.color == "red"
                # Case 1
                # Uncle is red
                z.get_parent.get_parent.flip_color
                z.get_parent.flip_color
                z.get_uncle.flip_color
                z = z.get_parent
              else
                # Case 3
                # Uncle is black
                # RIGHT ROTATE METHOD
                z.get_parent.flip_color
                z.get_uncle.flip_color
                z.get_parent.get_parent.rotate_right
                z = z.get_parent.get_parent
              end
            else
              # Uncle is nil -> Treat as black
              # If grandparent is root, parent becomes new root
              # Case 3
              if z.get_parent.get_parent == @root
                @root = z.get_parent
              end

              z.get_parent.flip_color
              z.get_parent.get_parent.flip_color
              z.get_parent.get_parent.rotate_right

              z = z.get_parent
            end
          elsif z == z.get_parent.right
            if !(z.get_uncle == nil)
              # If uncle exists
              if z.get_uncle.color == "red"
                # Case 1
                # Uncle is red
                z.get_parent.get_parent.flip_color
                z.get_parent.flip_color
                z.get_uncle.flip_color
                z = z.get_parent
              else
                # Case 
                # Uncle is 
              end
            else
              # Uncle is nil -> Treat as black
              # Case 2
              z.get_parent.rotate_left
              z = z.left
            end
          end

        elsif z.parent == z.parent.parent.right
          if z == z.get_parent.right
            # If uncle exists then
            if !(z.get_uncle == nil)
              if z.get_uncle.color == "red"
                # Case 1
                # Uncle is red
                z.parent.parent.flip_color
                z.parent.flip_color
                z.get_uncle.flip_color
                z = z.get_parent.get_parent
              else
                # Case 3
                # Uncle is black
                z.parent.flip_color
                z.get_parent.get_parent.flip_color
                z.get_uncle.flip_color
                z.parent.rotate_left
                z = z.get_parent
              end
            else
              # Case 3
              # Uncle is nil -> treat as black
              # If grandparent is root, parent becomes new root.
              if z.get_parent.get_parent == @root
                @root = z.get_parent
              end
              z.parent.flip_color
              z.get_parent.get_parent.flip_color

              z.get_parent.get_parent.rotate_left
              
              z = z.get_parent
            end
          elsif z == z.get_parent.left
            if !(z.get_uncle == nil)
              if z.get_uncle.color == "red"
                # Case 1
                z.parent.parent.flip_color
                z.parent.flip_color
                z.get_uncle.flip_color
                z = z.get_parent.get_parent
              else
                # Case 
                # Uncle is black
              end
            else
              # Uncle is nil - > treat as black
              # CASE 2
              # Right rotate on z.parent
              z.get_parent.rotate_right
              z = z.right
            end
          end
        end
      else
        # Case 0
        @root.set_color("black")
      end
    end
  end

  def find(value)
    current_node = @root
    while !(current_node.value == value)
      if value < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end

      if current_node.nil?
        puts "#{value} is not in the tree"
        return
      end
    end
    
    puts "Node found"
    return current_node
  end
end
