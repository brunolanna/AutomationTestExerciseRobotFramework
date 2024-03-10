*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                http://automationexercise.com
${Product1}           Men Tshirt
${Product2}           Blue Top
${SearchBar}          id:search_product
${SearchButton}       id:submit_search
${AddToCartProduct1}  id:2
${AddToCartProduct1}  id:1
${ContinueShopping}   xpath://*[@id="cartModal"]/div/div/div[3]/button
${PriceProduct1}      xpath://*[@id="product-2"]/td[3]/p
${PriceProduct2}      xpath://*[@id="product-1"]/td[3]/p
${QuantityProduct1}   xpath://*[@id="product-2"]/td[4]/button
${QuantityProduct2}   xpath://*[@id="product-1"]/td[4]/button
${TotalProduct1}      xpath://*[@id="product-2"]/td[5]/p
${TotalProduct2}      xpath://*[@id="product-1"]/td[5]/p

*** Test Cases ***
Example Test
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Navigate to Products Page
    Verify if search bar is visible
    Search for the first product    ${Product1}
    Click in the search button
    Verify if the first product is visible
    Add first product to the cart
    Click Continue Shopping button
    Verify again if search bar is visible
    Search for the second product    ${Product2}
    Click again in the search button
    Verify if the second product is visible
    Add second product to the cart
    Click to the Cart
    Verify if products is visible in the cart
    Verify the sum of the product value is correct

*** Keywords ***
Navigate to Products Page
    Go To    /products

Verify if search bar is visible
    Page Should Contain Element    ${SearchBar}

Search for the first product
    [Arguments]    ${Product1}
    Input Text    ${SearchBar}    ${Product1}

Click in the search button
    Click Element    ${SearchButton}

Verify if the first product is visible
    Page Should Contain Element    ${Product1}

Add first product to the cart
    Click Element    ${AddToCartProduct1}

Click Continue Shopping button
    Click Element    ${ContinueShopping}

Search for the second product
    [Arguments]    ${Product2}
    Input Text    ${SearchBar}    ${Product2}

Click again in the search button
    Click Element    ${SearchButton}

Verify if the second product is visible
    Page Should Contain Element    ${Product2}

Add second product to the cart
    Click Element    ${AddToCartProduct1}

Click to the Cart
    Go To    /view_cart

Verify if products is visible in the cart
    Page Should Contain Element    ${Product1}
    Page Should Contain Element    ${Product2}

Verify the sum of the product value is correct
    ${total1}=   Get Text    ${PriceProduct1}
    ${total1}=   Remove String    ${total1}    Rs.
    ${total1}=   Convert To Number    ${total1}
    ${expectedTotal1}=  Evaluate    ${total1} * ${QuantityProduct1}

    ${totalWeb1}=   Get Text    ${TotalProduct1}
    ${totalWeb1}=   Remove String    ${totalWeb1}    Rs.
    ${totalWeb1}=   Convert To Number    ${totalWeb1}

    Should Be Equal As Numbers    ${totalWeb1}     ${expectedTotal1}

    ${total2}=   Get Text    ${PriceProduct2}
    ${total2}=   Remove String    ${total2}    Rs.
    ${total2}=   Convert To Number    ${total2}
    ${expectedTotal2}=  Evaluate    ${total2} * ${QuantityProduct2}

    ${totalWeb2}=   Get Text    ${TotalProduct2}
    ${totalWeb2}=   Remove String    ${totalWeb2}    Rs.
    ${totalWeb2}=   Convert To Number    ${totalWeb2}

    Should Be Equal As Numbers    ${totalWeb2}     ${expectedTotal2}





