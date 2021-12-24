#!/bin/bash

cat new.json | jq ".parameters" >> new_parameters.json
cat old.json | jq ".parameters" >> old_parameters.json

# Human readable but verbose
#diff -y  old_parameters.json new_parameters.json

# Less readable but concise
diff --suppress-common-lines --context=2 old_parameters.json new_parameters.json

rm old_parameters.json
rm new_parameters.json
