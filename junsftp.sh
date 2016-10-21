#!/usr/bin/expect 
################################################################
#### Usage example: ./junsftp.sh 2016-1021-0555 file1 file2 ####  
#### Script written by Darryl Ashburner(dhbunny@gmail.com)  ####
#### Script to upload files to Junipers SFTP site using     ####
#### case number and files as arguments on local machine.   ####
################################################################
set case [lindex $argv 0]
set file1 [lindex $argv 1]
set file2 [lindex $argv 2]
spawn sftp anonymous@sftp.juniper.net 
expect "anonymous@sftp.juniper.net's password:" 
send "anonymous\n" 
expect "sftp>" 
send "cd pub\r" 
expect "sftp>" 
send "mkdir incoming/$case\r" 
expect "sftp>" 
send "cd incoming/$case\r" 
expect "sftp>" 
send "mput $file1\r" 
expect "sftp>" 
send "mput $file2\r" 
expect "sftp>" 
send "quit \r"
