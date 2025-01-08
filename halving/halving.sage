class Node:
    def __init__(self, value, marked):
        self.value = value
        self.marked = marked

    def __eq__(self, other):
        return isinstance(other, Node) and self.value == other.value and self.marked == other.marked

    def __repr__(self):
        return f"Node(value={self.value}, marked={self.marked})"

class Halving:
    @staticmethod
    def contains_marked(arr):
        """
        Check if any node in the array is marked.
        """
        return any(node.marked for node in arr)

    @staticmethod
    def node_halving_starter(arr):
        """
        Find up to two marked nodes in the array using a halving algorithm.
        """
        if not arr:
            return []

        marked_nodes = []

        while len(marked_nodes) < 2 and Halving.contains_marked(arr):
            marked_node = Halving.find_marked(arr)
            if not marked_node:
                break

            marked_nodes.append(marked_node)
            arr.remove(marked_node)  # Remove the found node to search for the next

        return marked_nodes

    @staticmethod
    def find_marked(arr):
        """
        Recursively find a single marked node using a halving approach.
        """
        if not arr:
            return None

        if len(arr) == 1:
            return arr[0] if arr[0].marked else None

        mid = len(arr) // 2
        left = arr[:mid]
        right = arr[mid:]

        if Halving.contains_marked(left):
            return Halving.find_marked(left)
        elif Halving.contains_marked(right):
            return Halving.find_marked(right)

        return None

# Demo
nodes = [
    Node(1, False),
    Node(2, True),
    Node(3, False),
    Node(4, True)
]

# Run the halving algorithm
print(Halving.node_halving_starter(nodes))  # Output: [Node(value=2, marked=True), Node(value=4, marked=True)]

# More examples
# 1 node is marked
# nodes = [Node(value=1, marked=True)]
# nodes = [Node(value=2, marked=false), Node(value=1, marked=True)]
# 2 nodes are marked
# nodes = [Node(value=1, marked=true), Node(value=2, marked=true)]
# nodes = [Node(value=1, marked=false), Node(value=2, marked=true), Node(value=3, marked=false), Node(value=4, marked=true)]
# print(Halving.node_halving_starter(nodes))
