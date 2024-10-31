import csv

# Need to have default pass2csv file, this scripts only format that file to be
# compatible with bitwarden csv format

# Here link do download pass2csv
# https://github.com/reinefjord/pass2csv

# Input and output CSV file names
input_csv = "./pass.csv"
output_csv = "output.csv"


# Function to capitalize the first letter
def capitalize_first_letter(s):
    return s.capitalize()


# Open input and output CSV files
with open(input_csv, mode="r", newline="") as infile, open(
    output_csv, mode="w", newline=""
) as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)

    # Write header to output CSV
    writer.writerow(
        [
            "collections",
            "type",
            "name",
            "notes",
            "fields",
            "reprompt",
            "login_uri",
            "login_username",
            "login_password",
            "login_totp",
        ]
    )

    # Read and process each row
    for row in reader:
        if row[0] == "Group(/)":
            continue  # Skip header line

        group = row[0]
        title = row[1]
        password = row[2]
        url = row[3]
        username = row[4]
        notes = row[5]

        # Map values
        collections = capitalize_first_letter(title)
        type_ = "login"
        name = capitalize_first_letter(group)
        login_password = password
        login_username = username

        # Combine notes
        combined_notes = f"{notes} {url}".strip().replace(",", " ")

        # Write to output CSV
        writer.writerow(
            [
                collections,
                type_,
                name,
                combined_notes,
                "",
                "",
                "",
                login_username,
                login_password,
                "",
            ]
        )
