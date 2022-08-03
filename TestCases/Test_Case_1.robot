**** Settings ***
Library    RequestsLibrary

**** Variables ***
${base_url}    https://api-staging.ioteconnect.com/network
${idType}    iccids
${idValue}    8910390000057568602

*** Test Cases ***
QueryThing
    ${headers}=  Create Dictionary   Authorization    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50X2lkIjoiMjAwMDMzMSIsInNjb3BlIjpbImludGVncmF0aW9uIl0sImp0aSI6IjUxNjhkYjhiLTZlYzgtNDhkNS05MTQzLTMyOTkzZTA4ZDEwYyIsImNsaWVudF9pZCI6ImhhbmRvdXQifQ.LHRB06uRnVpIMsH3iRrs0kB6smTRqEdTSV2KN6l9KSA
    create session    mysession     ${base_url}    verify=true
    ${response}=    GET On Session  mysession    /things/${idType}/${idValue}    headers=${headers}
    log to console    ${response.content}