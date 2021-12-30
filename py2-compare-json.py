import json

file_html = open('compare.html', 'w')
file_html.write("<table border='1'>")
file_html.write("<tbody>")
file_html.write("<tr><td><b>Parameter Name</b></td><td><b>Attribute Name</b></td><td><b>Old Value</b></td><td><b>New Value</b></td></tr>" )

#converting new.json files to dict
with open('new.json') as f:
    new_file = json.load(f)     

with open('old.json') as f:
    old_file = json.load(f)       

#loop through parameters in new.json and old.json and compare the difference
for params in new_file['parameters']:
    if params in old_file['parameters']:
        if new_file['parameters'][params] != old_file['parameters'][params]:
          for params1 in new_file['parameters'][params]:
             if new_file['parameters'][params][params1] != old_file['parameters'][params][params1]:
                file_html.write("<tr><td>" + params + "</td><td>" + params1 + "</td><td>" + str(old_file['parameters'][params][params1]) + "</td><td>" + str(new_file['parameters'][params][params1]) + "</td></tr>")

file_html.write("</table>")
file_html.write("</tbody>")
file_html.close()
