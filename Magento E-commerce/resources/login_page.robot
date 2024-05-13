*** Settings ***
Library     RPA.Browser.Selenium


*** Keywords ***
Open Browser And Maximize Window
    [Arguments]    ${URL_BROWSER}
    Open Available Browser    ${URL_BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${email}    ${pass}    ${element_page}
    ${login_successful}=    Run Keyword And Ignore Error    Perform Login    ${email}    ${pass}
    IF    not ${login_successful}
        Log    Failed to login with credentials
    ELSE
        Log    Successfully logged in with credentials
    END
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${element_page}

Perform Login
    [Arguments]    ${email}    ${pass}

    ${emailVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=email    10s
    IF    not ${emailVisible}    Log And Exit    Email input not found
    Input Text    id=email    ${email}

    ${passVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=pass    10s
    IF    not ${passVisible}    Log And Exit    Password input not found
    Input Password    id=pass    ${pass}

    Click Button When Visible    id=send2

Log And Exit
    [Arguments]    ${message}
    Log    ${message}    level=ERROR
    RETURN