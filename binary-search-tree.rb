require './node.rb'
require './tree.rb'

sample_array = [1, 7, 4, 23, 8, 9, 4, 3, 5 ,7, 9, 67, 6345, 423]
sample_array2 = [1, 7, 4, 23, 8, 9, 4, 3]

tree = Tree.new(sample_array2)
tree.build_tree(sample_array2)

puts tree.root.inspect
# filename = "exampletree.txt"

# example_file = File.open(filename, "w")
#   example_file.puts tree.all
# example_file.close