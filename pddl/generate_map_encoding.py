

adjacencies = []

# Read in adjacencies
with open('pddl/map_adjacencies.txt') as reader:
    line = " "
    while line:
        line = reader.readline()
        # If not a comment, add to adjacencies list
        if len(line) > 0 and line[0] != ";":
            adjacencies.append(to_tuple(line))