#!/bin/bash

first_day_of_class="2019-01-15"
last_day_of_class="2019-05-01"


raw_date=$(date -d ${first_day_of_class} +"%Y%m%d")
raw_last_date=$(date -d ${last_day_of_class} +"%Y%m%d")



until [ "${raw_date}" -ge ${raw_last_date} ]; do

	date -d ${raw_date} +"%Y-%m-%d"
	date -d "${raw_date} +2days" +"%Y-%m-%d"
	
	raw_date=$(date -d "${raw_date} +7days" +"%Y%m%d")
	#echo ${raw_date}
	#echo ${raw_last_date}
	#exit
done

