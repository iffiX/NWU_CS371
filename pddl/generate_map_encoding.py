

adjacencies = []
opposites_directions = {
    "north-directly":"south-directly",
    "west-directly":"east-directly",
    "south-directly":"north-directly",
    "east-directly":"west-directly",
    "northwest-directly":"southeast-directly",
    "southwest-directly":"northeast-directly",
    "southeast-directly":"northwest-directly",
    "northeast-directly":"southwest-directly",
}

# Read in adjacencies
with open('pddl/map_adjacencies.txt') as reader:
    line = " "
    while line:
        line = reader.readline().lower()
        # If not a comment, add to adjacencies list
        if len(line) > 0 and line[0] != ";":
            adjacencies.append(line.strip("\n").split(" "))

adjacency_facts = ""
# Create adjacency relation for each pair
for a in adjacencies:
    adjacency_facts += "(adjacent " + a[0] + " " + a[1] + " " + a[2] + ")\n"
    adjacency_facts += "(adjacent " + a[1] + " " + a[0] + " " + opposites_directions[a[2]] + ")\n"

print(adjacency_facts)