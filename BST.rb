require './node.rb'
require './tree.rb'

sample_array = [1, 7, 4, 23, 8, 9, 4, 3, 5 ,7, 9, 67, 6345, 423]
sample_array2 = [1,2,3,4, 5]

ExampleTree = Tree.new([1,2,3,4,5])

# ExampleTree.insertE(3)
# ExampleTree.insertE(2)
# ExampleTree.insertE(5)
# ExampleTree.insertE(4)
# ExampleTree.insertE(6)
# ExampleTree.insertE(7)

sample_array2.each do |element|
    ExampleTree.insertE(element)
end

# ExampleTree.insertE(4)
# ExampleTree.insertE(2)
# ExampleTree.insertE(3)



# puts ExampleTree.root.to_json
# puts ExampleTree.root.right.to_json
# puts ExampleTree.root.left.to_json
