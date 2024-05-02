*** Settings ***
Documentation
...                 The goal of this project is to develop a web automation tool capable of performing various tasks on an e-commerce website.
...                 The automation process includes logging into the website, searching for products based on user input,
...                 adding selected products to the shopping cart, and simulating the checkout process.

Library             RPA.Browser.Selenium
Library             DOP.RPA.Log
Library             DOP.RPA.Asset
Library             DOP.RPA.ProcessArgument
Library             RPA.Excel.Files
Library             Collections
Library             String
Resource            resources/login_page.robot
Resource            resources/mouse_action.robot

Suite Setup         Open Browser And Maximize Window    ${URL_PAGE_MAGENTO}


*** Variables ***
${URL_PAGE_MAGENTO}     https://magento.softwaretestingboard.com/
${DATA_MAGENTO}         Data Magento E-commerce.xlsx

${ID_MEN}               ui-id-5
${ID_TOPS_MEN}          ui-id-17
${ID_JACKETS_MEN}       ui-id-19
${ID_HOODIES_MEN}       ui-id-20
${ID_TEES_MEN}          ui-id-21
${ID_TANKS_MEN}         ui-id-22
${ID_BOTTOMS_MEN}       ui-id-18
${ID_PANTS_MEN}         ui-id-23
${ID_SHORTS_MEN}        ui_id_24

${ID_WOMEN}             ui-id-4
${ID_TOPS_WOMEN}        ui-id-9
${ID_JACKETS_WOMEN}     ui-id-11
${ID_HOODIES_WOMEN}     ui-id-12
${ID_TEES_WOMEN}        ui-id-13
${ID_TANKS_WOMEN}       ui-id-14
${ID_BOTTOMS_WOMEN}     ui-id-10
${ID_PANTS_WOMEN}       ui-id-15
${ID_SHORTS_WOMEN}      ui_id_16

${ID_GEAR}              ui-id-6
${ID_BAGS_GEAR}         ui-id-25
${ID_FITNESS_GEAR}      ui-id-26
${ID_WATCHES_GEAR}      ui-id-27


*** Tasks ***
Automated E-commerce Shopping
    Login With Magento Credentials
    Choose Each Product
    Check All Product
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

Choose Each Product
    [Documentation]    Clicks on the product link based on the product category and type.

    ${category}=    Get In Arg    category
    ${category_value}=    Set Variable    ${category}[value]

    ${wearables}=    Get In Arg    wearables
    ${wearables_value}=    Set Variable    ${wearables}[value]

    ${product_type}=    Get In Arg    product_type
    ${product_type_value}=    Set Variable    ${product_type}[value]

    ${color}=    Get In Arg    wearables
    ${color_value}=    Set Variable    ${color}[value]

    ${size}=    Get In Arg    wearables
    ${size_value}=    Set Variable    ${size}[value]

    ${below_price}=    Get In Arg    wearables
    ${below_price_value}=    Set Variable    ${below_price}[value]

    ${above_price}=    Get In Arg    wearables
    ${above_price_value}=    Set Variable    ${above_price}[value]

    IF    '${category_value}' == 'Men'
        Mouse Over Element    ${ID_MEN}
        IF    '${wearables_value}' == 'Tops'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_TOPS_MEN}"]
            Mouse Over Element    ${ID_TOPS_MEN}
            IF    '${product_type_value}' == 'Jackets'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_JACKETS_MEN}"]
                Mouse Over And Click Element    ${ID_JACKETS_MEN}
            END
            IF    '${product_type_value}' == 'Hoodies & Sweatshirts'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_HOODIES_MEN}"]
                Mouse Over And Click Element    ${ID_HOODIES_MEN}
            END
            IF    '${product_type_value}' == 'Tees'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_TEES_MEN}"]
                Mouse Over And Click Element    ${ID_TEES_MEN}
            END
            IF    '${product_type_value}' == 'Tanks'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_TANKS_MEN}"]
                Mouse Over And Click Element    ${ID_TANKS_MEN}
            END
        END

        IF    '${wearables_value}' == 'Bottoms'
            Mouse Over Element    ${ID_BOTTOMS_MEN}
            IF    '${product_type_value}' == 'Pants'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_PANTS_MEN}"]
                Mouse Over And Click Element    ${ID_PANTS_MEN}
            END
            IF    '${product_type_value}' == 'Shorts'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_SHORTS_MEN}"]
                Mouse Over And Click Element    ${ID_SHORTS_MEN}
            END
        END
    END

    IF    '${category_value}' == 'Women'
        Mouse Over Element    ${ID_WOMEN}
        IF    '${wearables_value}' == 'Tops'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_TOPS_WOMEN}"]
            Mouse Over Element    ${ID_TOPS_WOMEN}
            IF    '${product_type_value}' == 'Jackets'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_JACKETS_WOMEN}"]
                Mouse Over And Click Element    ${ID_JACKETS_WOMEN}
            END
            IF    '${product_type_value}' == 'Hoodies & Sweatshirts'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_HOODIES_WOMEN}"]
                Mouse Over And Click Element    ${ID_HOODIES_WOMEN}
            END
            IF    '${product_type_value}' == 'Tees'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_TEES_WOMEN}"]
                Mouse Over And Click Element    ${ID_TEES_WOMEN}
            END
            IF    '${product_type_value}' == 'Bras & Tanks'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_TANKS_WOMEN}"]
                Mouse Over And Click Element    ${ID_TANKS_WOMEN}
            END
        END

        IF    '${wearables_value}' == 'Bottoms'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_BOTTOMS_WOMEN}"]
            Mouse Over Element    ${ID_BOTTOMS_WOMEN}
            IF    '${product_type_value}' == 'Pants'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_PANTS_WOMEN}"]
                Mouse Over And Click Element    ${ID_PANTS_WOMEN}
            END
            IF    '${product_type_value}' == 'Shorts'
                Wait Until Element Is Visible    xpath=//a[@id="${ID_SHORTS_WOMEN}"]
                Mouse Over And Click Element    ${ID_SHORTS_WOMEN}
            END
        END
    END

    IF    '${category_value}' == 'Gear'
        Mouse Over Element    ${ID_GEAR}
        IF    '${product_type_value}' == 'Bags'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_BAGS_GEAR}"]
            Mouse Over And Click Element    ${ID_BAGS_GEAR}
        END
        IF    '${product_type_value}' == 'Fitness Equipment'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_FITNESS_GEAR}"]
            Mouse Over And Click Element    ${ID_FITNESS_GEAR}
        END
        IF    '${product_type_value}' == 'Watches'
            Wait Until Element Is Visible    xpath=//a[@id="${ID_WATCHES_GEAR}"]
            Mouse Over And Click Element    ${ID_WATCHES_GEAR}
        END
    END

    FOR    ${element}    IN    1    9
        Check One Product    ${element}
        Select Size And Color    ${size_value}    ${color_value}
    END

Check All Product
    FOR    ${element}    IN    1    9
        Check One Product    ${element}
    END

Check One Product
    [Arguments]    ${index}
    Click Element    xpath=(//ol[@class='product-items'])[1]/li[${index}]//a[@class='product-item-link']
    Sleep    2s

Select Size And Color
    [Arguments]    ${size}    ${color}
    Click Element    xpath=//div[@class='swatch-attribute-options clearfix']//div[@option-label='${size}']
    Click Element    xpath=//div[@class='swatch-attribute-options clearfix']//div[@option-label='${color}']