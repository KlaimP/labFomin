import random

def read_list(file):
	f = open(file, "r")
	lst = f.read().splitlines()
	f.close()
	return lst

def name_case(list):
	for i in range(0, len(list)):
		list[i] = list[i].capitalize()

first_female = read_list("name-first-female.txt"); name_case(first_female)
first_male = read_list("name-first-female.txt"); name_case(first_male)
last_all = read_list("name-last-all.txt"); name_case(last_all)

names = 100
f = open("marking-sample-names.sql", "w")
f.write("INSERT INTO marking_sample.student (id, first, last, sex) VALUES \n")

for i in range(0, names):
	z = random.randint(0, len(last_all) - 1)
	last = last_all[z]

	w = random.randint(0, 1)
	if w == 0:
		x = random.randint(0, len(first_female) - 1)
		first = first_female[x]
		sex = "F"
	else:
		y = random.randint(0, len(first_male) - 1)
		first = first_male[y]
		sex = "M"

	f.write(f"\t({i + 1}, '{first}', '{last}', '{sex}')")
	if i < names - 1:
		f.write(",\n")

f.write("\n")
f.close()
