#   (c) Copyright 2017 Hewlett-Packard Enterprise Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
########################################################################################################################
#!!
#! @description: Adds an element to a list of strings
#!
#! @input list: List in which to add the element
#!              Example: '1,2,3,4,5,6'
#! @input element: Element to add to the list
#!                 Example: '7'
#! @input delimiter: The list delimiter
#!
#! @output response: 'success' or 'failure'
#! @output return_result: The new list or an error message otherwise
#! @output return_code: 0 if success, -1 if failure
#!
#! @result SUCCESS: The new list was retrieved with success
#! @result FAILURE: Otherwise
#!!#
########################################################################################################################

namespace: io.cloudslang.base.lists

operation:
  name: add_element

  inputs:
    - list
    - element
    - delimiter

  java_action:
    gav: 'io.cloudslang.content:cs-lists:0.0.6'
    class_name: io.cloudslang.content.actions.ListAppenderAction
    method_name: appendElement

  outputs:
    - return_result: ${returnResult}
    - return_code: ${returnCode}

  results:
    - SUCCESS: ${returnCode == '0'}
    - FAILURE
