#!/usr/bin/env python

import sys

def write_stdout(str):
    """only eventlistener protocol messages may be sent to stdout"""
    sys.stdout.write(str)
    sys.stdout.flush()

def write_stderr(str):
    """Output to user"""
    sys.stderr.write(str)
    sys.stderr.flush()

def main():
    """Main loop"""

    while 1:
        # transition from ACKNOWLEDGED to READY
        write_stdout('READY\n')

        # read header line and print it to stderr
        line = sys.stdin.readline()
        write_stderr(line)

        # read event payload and print it to stderr
        headers = dict([x.split(':') for x in line.split()])
        data = sys.stdin.read(int(headers['len']))
        write_stderr(data)

        # transition from READY to ACKNOWLEDGED
        write_stdout('RESULT 2\nOK')

if __name__ == '__main__':
    main()