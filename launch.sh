#! /usr/bin/expect
if {$argc > 0} {
  spawn ssh zelin@222.200.182.82
  expect "*password*"
  send "zelin\r"
  expect "*sagittarius*"
  set ip [lindex $argv 0]
  # spawn ssh "192.168.1.$ip"
  send "ssh zelin@192.168.1.$ip\r"
  expect {
    "*yes/no*" {send "yes\r"; exp_continue}
    "*password*" {send "zelin\r"}
  }
  interact
}
if {$argc < 1} {
  spawn ssh -D 12345 zelin@222.200.182.82
  expect "*password*"
  send "zelin\r"
  interact
}

