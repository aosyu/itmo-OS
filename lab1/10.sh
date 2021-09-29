#!/bim/bash

man bash | grep -o "[[:alnum:]]\{4,\}" | sort | uniq -c -i | sort -k1 -r -n | head -3 
