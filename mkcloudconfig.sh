#!/bin/bash

cat templates/user_data.head>user_data
sed 's/^/  - /' keys>>user_data
cat templates/user_data.tail>>user_data
