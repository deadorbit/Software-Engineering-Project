# import csv data and convert to JSON
import csv
import json

def convert_csv_to_json(file_path):
    data = []
    with open(file_path, 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            data.append(row)
    json_data = json.dumps(data)
    return json_data

# write to JSON file called apple_data.json
def write_to_json_file(json_data, stock_symbol):
    with open(stock_symbol + '.json', 'w') as json_file:
        json_file.write(json_data)

def main():
    file_path = 'HistoricalData_1707677221281.csv'
    json_data = convert_csv_to_json(file_path)
    write_to_json_file(json_data)
    print(json_data)

if __name__ == '__main__':
    main()