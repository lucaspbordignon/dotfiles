import subprocess as sbp
import re

command = sbp.check_output('acpi')
command = command.split()
value = command[3]
state = command[2]

value = re.search(r'\d\d', str(value)).group()
state = re.search(r'[CD]', str(state)).group()

if(state == 'C'):
    state = "Charg."
else:
    state = "Dis."

fulltext = '{}  {}%'.format(state, value)
print(fulltext)
