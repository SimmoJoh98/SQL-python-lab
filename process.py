log_file = open("um-server-01.txt")
# declares a variable equal to the txt data of the file^

def sales_reports(log_file): # declares a function
    for line in log_file:   # loops over each line of the file we opened
        line = line.rstrip() # removes trailing characters to the right and returns that string for each line in the file.
        day = line[0:3] # accesses row 0 index 3 (4th item) 
        if day == "Mon":    #checks to see if the day is Tuesday (edited to be Monday), and if it is, print it.
            print(line)
#EXTRA CRED
def melonator(log_file):
    for line in log_file:
        row = line.split(' ')
        ans = row[0:4]
        melon = int(ans[2])
        if melon > 10:
            print(' '.join(row))

sales_reports(log_file)
log_file.close()