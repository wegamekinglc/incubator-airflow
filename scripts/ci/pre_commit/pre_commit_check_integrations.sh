#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
set -euo pipefail

export PRINT_INFO_FROM_SCRIPTS="false"
export SKIP_CHECK_REMOTE_IMAGE="true"

# shellcheck source=scripts/ci/libraries/_script_init.sh
. "$( dirname "${BASH_SOURCE[0]}" )/../libraries/_script_init.sh"

cd "${AIRFLOW_SOURCES}"

. breeze-complete

if [[ "${AVAILABLE_INTEGRATIONS} all" != "${_breeze_allowed_integrations}" ]]; then
  echo
  echo "Error: Allowed integrations do not match!"
  echo
  echo "The ./scripts/ci/libraries/_initialization.sh integrations (AVAILABLE_INTEGRATIONS):"
  echo "${AVAILABLE_INTEGRATIONS}"
  echo
  echo "The ./breeze-complete integrations (_breeze_allowed_integrations):"
  echo "${_breeze_allowed_integrations}"
  echo
  echo "_breeze_allowed_integrations should match AVAILABLE_INTEGRATIONS plus 'all'"
  echo
  echo "Please align the two!"
  echo
  exit 1
fi
