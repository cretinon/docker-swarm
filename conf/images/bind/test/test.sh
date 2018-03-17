#!/bin/sh

dig  -y secret:c2VjcmV0 @167.114.242.58 cretinon.fr axfr
nsupdate -y secret:c2VjcmV0 nsupdate.conf
dig  -y secret:c2VjcmV0 @167.114.242.58 cretinon.fr axfr

