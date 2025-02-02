*** Settings ***
Suite Setup        Common.Start Suite
Suite Teardown     Common.End Suite
Test Teardown      Common.End Test
Resource           ../Resources/Common.robot
Resource           ../Resources/PO/BINGPage.robot

*** Variables ***
${TEXT_TO_SEARCH}    ${EMPTY}
${COOKIES_ACCEPTED}    ${False}

*** Test Cases ***
TC1: User is able to search for specific phrase
    Given User is on BING search engine page
    And Page should contain search bar
    When User search phrase 'semrush'
    Then Search results are displayed
    And Semrush short information is displayed on the right side of page

TC2: Semrush page is positioned on the first spot during search
    Given User is on BING search engine page
    And Page should contain search bar
    When User search phrase 'semrush'
    Then Search results are displayed
    And Semrush page is positioned as first result

TC3: Semrush company address is displayed after switching to maps
    Given User is on BING search engine page
    And Page should contain search bar
    When User search phrase 'semrush'
    And User switch to Maps tab
    Then Proper company address is displayed

*** Keywords ***
User is on BING search engine page
    Go To    ${MAIN_URL}
    Wait Until Location Contains    bing.com    timeout=10s
    Run Keyword If    ${COOKIES_ACCEPTED}!=${True}    Accept Cookies

Accept Cookies
    TRY
        ${cookies}    Run Keyword And Return Status    Wait for cookies animation
        Run Keyword If    ${cookies} == True
        ...    Set Suite Variable    ${COOKIES_ACCEPTED}    ${True}
    EXCEPT    AS    ${msg}
        Log    message=${msg}
    END

Wait for cookies animation
    Wait Until Keyword Succeeds    2x    5s    BINGPage.Accept Cookies

Page should contain search bar
    Wait Until Keyword Succeeds    5x    1s    BINGPage.Search bar is visible


User search phrase '${TEXT_TO_SEARCH}'
    BINGPage.Search text    ${TEXT_TO_SEARCH}


Search results are displayed
    Wait Until Keyword Succeeds    5x    5s    BINGPage.Scope bar is visible


Semrush short information is displayed on the right side of page
    Wait Until Keyword Succeeds    5x    1s    BINGPage.Semrush side bar is visible

Semrush page is positioned as first result
    Wait Until Keyword Succeeds    5x    2s    BINGPage.First result contains semrush.com page

User switch to Maps tab
    Click Maps Label


Proper company address is displayed
    Address should be visible
