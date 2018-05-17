import subprocess
payload = ""
exploit = "\x90"
exploit += ""
exploit += payload
print exploit
subprocess.call(['J:\School\Fall 2017\CSCI 2333 - Computer Organization & Assembly Language\Program 7\smashing_the_stack_notes_windows-master\VisualStudioProject\bufferOverflow\Debug\bufferOverflow', exploit])
