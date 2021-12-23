#Import json library
require 'json'

# read new.json file into new_hash
new_hash_parameters = JSON.parse(File.read('new.json'))["parameters"]

# read old.json file into old_hash
old_hash_parameters = JSON.parse(File.read('old.json'))["parameters"]

# new_keys = new hash of keys from new_hash_parameters but not in old_hash_parameters
new_keys = new_hash_parameters.keys - old_hash_parameters.keys
old_keys = old_hash_parameters.keys - new_hash_parameters.keys

html_table = "<table>\n<tr><th>Parameter</th><th>Old Value</th><th>New Value</th></tr>\n"

# compare values of new_hash_parameters and old_hash_parameters
# where different add to diff_hash and output diff_hash
diff_hash = {}
new_hash_parameters.each do |key, value|
    if old_hash_parameters[key] != value
        html_table += "<tr><td>#{key}</td><td>#{old_hash_parameters[key]}</td><td>#{value}</td></tr>\n"
    end
end


html_table += "</table>\n"

# output html_table as a file output.html
File.open("output.html", "w") do |f|
    f.write(html_table)
end
