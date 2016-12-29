# protostar-solutions

This is a repository for the solutions of exploit excercises of Protostar at exploit-excercises.com.

To access the shell using shellcodes, execute the shells as follows:
```bash
(./exploit_stack#.sh; cat) | /opt/protostar/bin/stack#
```

Otherwise, you can just pipe in the output regularly:
```bash
./exploit_stack#.sh | /opt/protostar/bin/stack#
```

To debug from gdb, use the following line to run the binary with the exploit:
```bash
r < <(./exploit_stack#.sh)
```
