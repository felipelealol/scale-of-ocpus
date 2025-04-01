#!/bin/bash
# Created: 2023-Aug-25
# Last modified: 2025-Apr-01
 
if [[ $# -ne 2 ]]; then
    echo "Insert: $0 <VM_CLUSTER_ID> <NEW_OCPUS>"
    exit 1
fi
 
export PROFILE="my-dev-profile"
export VM_CLUSTER_ID="$1"
export NEW_OCPUS="$2"
#export EMAIL_ADDRESS=
export MAX_WAIT_SECONDS=1200
 
oci db vm-cluster update \
    --profile $PROFILE \
    --vm-cluster-id $VM_CLUSTER_ID \
    --cpu-core-count $NEW_OCPUS \
    --wait-for-state AVAILABLE \
    --max-wait-seconds $MAX_WAIT_SECONDS
 
#if [[ $? -eq 0 ]]; then
#    echo "0"
#else
#    echo "1"
#fi
 
#echo "$result_message" | mail -s "Result of OCPUs" $EMAIL_ADDRESS
 
exit $?
