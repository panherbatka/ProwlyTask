*** Settings ***
Resource    ../NetShare.robot

*** Variables ***

*** Keywords ***
Start Suite
    [Documentation]    Actions to be taken when suite starts
    NetShare.Create Webdriver

End Suite
    [Documentation]    Actions to be taken when suite ends
    Close All Browsers

End Test
    [Documentation]    Actions to be taken when test ends
    Run Keyword If Test Failed    SeleniumLibrary.Capture Page Screenshot
    Reload Page