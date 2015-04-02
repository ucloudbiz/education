#!/bin/bash

cloudmonkey set profile server 1>/dev/null
cloudmonkey listAvailableProductTypes \
			zoneid=eceb5d65-6571-4696-875f-5a17949f3317 \
			filter=productid,productstate,serviceofferingid,templateid,diskofferingid,diskofferingdesc,zoneid,zonedesc | grep -E 'cent.*6.4.*64bit.*1x1' -7
