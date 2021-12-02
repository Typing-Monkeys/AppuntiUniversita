#!/bin/bash

while true
do
	clear
	date
	condor_status
	condor_q -nobatch
	sleep 2
done