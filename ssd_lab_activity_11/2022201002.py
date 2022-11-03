import csv
import os

filename = 'lab_11_data.csv'
dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, filename)

fields = []
my_list = []
colsToDelete = 6

with open(filename) as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')

    for row in csv_reader:
        fields = row
        break

fields = fields[0:len(fields)-colsToDelete]

with open(filename, 'r', newline='') as csvfile:
    reader = csv.DictReader(csvfile)

    for row in reader:
        new_list = []
        for field in fields:
            row[field] = row[field].replace(',', '')
            new_list.append(row[field])

        my_list.append(new_list)

# print(len(my_list))

filtered_list = list(filter(lambda x: float(x[-1]) >= -3, my_list))
my_list = filtered_list

# print(len(my_list))

open_list = [[float(row[1]) for row in my_list]]
low_list = [[float(row[3]) for row in my_list]]
high_list = [[float(row[2]) for row in my_list]]

open_avg = list(map(lambda x: sum(x)/len(x), open_list))[0]
low_avg = list(map(lambda x: sum(x)/len(x), low_list))[0]
high_avg = list(map(lambda x: sum(x)/len(x), high_list))[0]

# print(open_avg)
# print(low_avg)
# print(high_avg)

f = open("avg_output.txt", "w")
f.write("open "+str(open_avg)+"\nhigh "+str(high_avg)+"\nlow "+str(low_avg))
f.close()

stockChar = input("Enter Stock First Alphabet: ")
filtered_list = list(filter(lambda x: str(
    x[0][0]) == stockChar, my_list))

with open("stock_output.txt", 'w') as f:
    for stock in filtered_list:
        f.write(' '.join(stock))
        f.write("\n")
