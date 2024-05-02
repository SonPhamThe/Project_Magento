*** Settings ***
Documentation
...                 The goal of this project is to develop a web automation tool capable of performing various tasks on an e-commerce website.
...                 The automation process includes logging into the website, searching for products based on user input,
...                 adding selected products to the shopping cart, and simulating the checkout process.

Library             RPA.Browser.Selenium
Library             DOP.RPA.Log
Library             DOP.RPA.Asset
Library             RPA.Excel.Files
Library             libraries/ProductDataExtractor.py
Resource            resources/login_page.robot
Resource            resources/mouse_action.robot

Suite Setup         Open Browser And Maximize Window    ${URL_PAGE_MAGENTO}


*** Variables ***
${URL_PAGE_MAGENTO}             https://magento.softwaretestingboard.com/
${DATA_MAGENTO}                 Data Magento E-commerce.xlsx


*** Tasks ***
Automated E-commerce Shopping
    Login With Magento Credentials
    Choose Product Specifications
    Close All Browsers


*** Keywords ***
Login With Magento Credentials
    [Documentation]    Logging into the Magento website using stored credentials. It clicks on the "Sign In" link,
    ...    retrieves the username and password from the available data file, and fills in the login form.
    ...    Finally, it verifies the successful login by waiting for the appearance of the customer name component.

    Click Link    link:Sign In
    ${meganto_account_credentials}=    Get Asset    meganto_account
    ${meganto_account_credentials}=    Set Variable    ${meganto_account_credentials}[value]
    Wait Until Keyword Succeeds
    ...    3x
    ...    1s
    ...    Login With Credentials
    ...    email
    ...    ${meganto_account_credentials}[username_meganto]
    ...    pass
    ...    ${meganto_account_credentials}[password_meganto]
    ...    css=span.customer-name

Choose Product Specifications
    ${data_magento_path}=    Set Variable    ${EXECDIR}${/}devdata${/}${DATA_MAGENTO}
    ${products_data}=    Extract Product Data    ${data_magento_path}
    FOR    ${product_data}    IN    @{products_data}
        Log    ${product_data}
        Choose Each Product    ${product_data}
    END

Choose Each Product
    [Documentation]    Clicks on the product link based on the product category and type.
    [Arguments]    ${product}
    ${category}=    Set Variable    ${product['category']}
    ${products_type}=    Set Variable    ${product['products_type']}
    ${details_type}=    Set Variable    ${product['details_type']}

    IF    '${category}' == 'Men'
        Mouse Over Element    ui-id-5
        IF    '${products_type}' == 'Tops'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-17"]
            Mouse Over Element    ui-id-17
            IF    '${details_type}' == 'Jackets'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-19"]
                Mouse Over And Click Element    ui-id-19
            END
            IF    '${details_type}' == 'Hoodies & Sweatshirts'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-20"]
                Mouse Over And Click Element    ui-id-20
            END
            IF    '${details_type}' == 'Tees'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-21"]
                Mouse Over And Click Element    ui-id-21
            END
            IF    '${details_type}' == 'Tanks'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-22"]
                Mouse Over And Click Element    ui-id-22
            END
        END

        IF    '${products_type}' == 'Bottoms'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-18"]
            Mouse Over Element    ui-id-18
            IF    '${details_type}' == 'Pants'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-23"]
                Mouse Over And Click Element    ui-id-23
            END
            IF    '${details_type}' == 'Shorts'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-24"]
                Mouse Over And Click Element    ui-id-24
            END
        END
    END

    IF    '${category}' == 'Women'
        Mouse Over Element    ui-id-4
        IF    '${products_type}' == 'Tops'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-9"]
            Mouse Over Element    ui-id-9
            IF    '${details_type}' == 'Jackets'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-11"]
                Mouse Over And Click Element    ui-id-11
            END
            IF    '${details_type}' == 'Hoodies & Sweatshirts'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-12"]
                Mouse Over And Click Element    ui-id-20
            END
            IF    '${details_type}' == 'Tees'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-13"]
                Mouse Over And Click Element    ui-id-13
            END
            IF    '${details_type}' == 'Bras & Tanks'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-14"]
                Mouse Over And Click Element    ui-id-14
            END
        END

        IF    '${products_type}' == 'Bottoms'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-10"]
            Mouse Over Element    ui-id-10
            IF    '${details_type}' == 'Pants'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-15"]
                Mouse Over And Click Element    ui-id-15
            END
            IF    '${details_type}' == 'Shorts'
                Wait Until Element Is Visible    xpath=//a[@id="ui-id-16"]
                Mouse Over And Click Element    ui-id-16
            END
        END
    END

    IF    '${category}' == 'Gear'
        Mouse Over Element    ui-id-6
        IF    '${details_type}' == 'Bags'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-25"]
            Mouse Over And Click Element    ui-id-25
        END
        IF    '${details_type}' == 'Fitness Equipment'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-26"]
            Mouse Over And Click Element    ui-id-26
        END
        IF    '${details_type}' == 'Watches'
            Wait Until Element Is Visible    xpath=//a[@id="ui-id-27"]
            Mouse Over And Click Element    ui-id-27
        END
    END
