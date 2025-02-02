*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MAIN_URL}    https://www.bing.com/

*** Keywords ***
Start Suite
    [Documentation]    Actions to be taken when suite starts
    Create Webdriver

End Suite
    [Documentation]    Actions to be taken when suite ends
    Close All Browsers

End Test
    [Documentation]    Actions to be taken when test ends
    Run Keyword If Test Failed    SeleniumLibrary.Capture Page Screenshot


Create Webdriver
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-search-engine-choice-screen
    Call Method    ${chrome_options}    add_argument    --incognito

    TRY
        SeleniumLibrary.Create Webdriver    Chrome    options=${chrome_options}
    EXCEPT    AS    ${msg}
        Fail    msg=${msg}
    END

    ${is_page_available}    Run Keyword And Return Status    Go To    ${MAIN_URL}
    Maximize Browser Window
    Run Keyword If    "${is_page_available}"=="False"    Fail    msg=Page not available - see screenshot
    Run Keyword If    "${is_page_available}"=="False"    SeleniumLibrary.Capture Page Screenshot
