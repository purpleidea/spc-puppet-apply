#!/bin/bash

echo 'I am run.sh...'
FACTER_fqdn=localhost puppet agent --test $@

