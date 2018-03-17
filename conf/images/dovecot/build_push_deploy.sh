#!/bin/sh

cd build/ ; ./build_me.sh ; cd - ; 
cd push/ ; ./push_to_local_registry.sh ; cd - ; 
cd deploy/ ; ./deploy_me.sh ; cd - ;
