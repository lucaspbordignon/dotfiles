import subprocess as sbp
import re

command = sbp.check_output('acpi')
command = command.split()

value = re.search(r'\d\d', str(command[3])).group()
state = re.search(r'[CD]', str(command[2])).group()

if(int(value) == 10):
    try:
        value = re.search(r'\d\d\d', str(command[3])).group()
    except:
        pass

if(state == 'C'):
    state = "Charg."
else:
    state = "Dis."

fulltext = '{}  {}%'.format(state, value)
print(fulltext)
