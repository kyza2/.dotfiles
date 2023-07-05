#!/bin/bash

# Get the current memory usage
#!/bin/bash
memusage=$(free | awk 'FNR == 2 {print $3/$2 * 100}')
echo $(printf "%.0f\n" $memusage)
