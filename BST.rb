require './node.rb'
require './tree.rb'

sample_array = [1, 7, 4, 23, 8, 9, 4, 3, 5 ,7, 9, 67, 6345, 423]
sample_array2 = [1,2,3,4, 5]

ExampleTree = Tree.new([1,2,3,4,5])

# ExampleTree.insert(3)
# ExampleTree.insert(2)
# ExampleTree.insert(5)
# ExampleTree.insert(4)
# ExampleTree.insert(6)
# ExampleTree.insert(7)

sample_array2.each do |element|
    ExampleTree.insert(element)
end

# ExampleTree.insert(4)
# ExampleTree.insert(2)
# ExampleTree.insert(3)

puts ExampleTree.find(6).to_json
# puts ExampleTree.root.to_json
# puts ExampleTree.root.right.to_json
# puts ExampleTree.root.left.to_json
