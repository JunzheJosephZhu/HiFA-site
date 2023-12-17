import os

# Directory where your video files are stored
directory = os.getcwd()

# HTML file to be created
output_html = "videos.html"

# HTML content
html_content = "<html>\n<body>\n<table>\n"

# Helper function to create a description from a filename
def create_description(filename):
    description = filename.replace('``', '').replace('"', '').replace('.gif', '').replace('_', ' ')
    return description.capitalize()

# Read filenames from the directory and sort them
filenames = [f for f in os.listdir(directory) if f.endswith(".gif")]
filenames.sort()

# Process files in pairs
for i in range(0, len(filenames), 2):
    # Initialize the row for images and descriptions
    image_row = "  <tr>\n"
    description_row = "  <tr>\n"

    # Process the first file in the pair
    file1 = filenames[i]
    mp4_path1 = f"./HiFA_files/fantasia3d_comparisons/{file1}"
    description1 = create_description(file1)

    # HTML for the first file
    image_row += f"    <td><img src=\"{mp4_path1}\" width=\"3200\" height=\"1600\"></td>\n"
    description_row += f"    <td colspan=\"1\" align=\"center\">{description1}</td>\n"

    # Process the second file in the pair if it exists
    if i + 1 < len(filenames):
        file2 = filenames[i+1]
        mp4_path2 = f"./HiFA_files/fantasia3d_comparisons/{file2}"
        description2 = create_description(file2)

        # HTML for the second file
        image_row += f"    <td><img src=\"{mp4_path2}\" width=\"3200\" height=\"1600\"></td>\n"
        description_row += f"    <td colspan=\"1\" align=\"center\">{description2}</td>\n"

    # Close the rows
    image_row += "  </tr>\n"
    description_row += "  </tr>\n"

    # Add rows to HTML content
    html_content += image_row + description_row

# Close the HTML tags
html_content += "</table>\n</body>\n</html>"

# Write the HTML content to a file
with open(output_html, "w") as file:
    file.write(html_content)

print(f"HTML file created: {output_html}")

