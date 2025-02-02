*** Settings ***
Resource    ../Common.robot
Variables    ../Locators/BINGPage.py


*** Keywords ***
Search text
    [Arguments]    ${text}
    Input Text    ${SearchInput}    ${text}
    Press Keys    None    RETURN

Search bar is visible
    Element Should Be Visible    ${SearchInput}

Scope bar is visible
    Element Should Be Visible    ${ScopeBar}

Semrush side bar is visible
    Element Should Be Visible    ${SemrushSideBarLabel}

Accept Cookies
    [Documentation]    Wait with timeout added because BING animates cookies prompt
    Wait Until Element Is Visible    ${AcceptCookiesButton}    timeout=10s
    Click Button    ${AcceptCookiesButton}

Reject Cookies
    [Documentation]    Wait with timeout added because BING animates cookies prompt
    Wait Until Element Is Visible    ${RejectCookiesButton}    timeout=10s
    Click Button    ${RejectCookiesButton}

Click Images Button
    Click Element    ${ImagesLink}

First result contains semrush.com page
    ${ads}    Run Keyword And Return Status    Search Ads are visible
    IF    ${ads} == True
        Wait Until Element Is Visible   ${SemrushFirstPositionWithAds}    timeout=10s
    ELSE
        Wait Until Element Is Visible    ${SemrushFirstPositionNoAds}    timeout=10s
    END

Search Ads are visible
    Page Should Contain Element    ${BINGFirstResultAds}

Click Maps Label
    Click Element    ${MapsLink}
    Switch Window    NEW

Address should be visible
    Wait Until Page Contains Element   ${SemrushAddress}
    Switch Window    MAIN