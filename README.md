
# Simple Test Framework for Recruitment Process

**Description:**  
I've used RF as the framework because it works flawlessly with Gherkin syntax. I can convert or rewrite the code to use Playwright or plain PyTest if required.

BING test cases (TCs) are prone to failures due to the nature of the page itself. I've done my best to catch and predict potential issues, but tests may still fail occasionally because I’m unaware of the rules operating "under the hood" of the BING search engine. For example, the right sidebar with brief information for the top search result isn’t always displayed, and I can’t determine why this happens.

I didn’t create any TCs for the Google page, as they would be very similar to the ones already created. However, I’ve provided steps for a manual walkthrough.

---

## Google Test Cases (TCs):

### Feature: User Searches for the Word "Prowly" Using Google Search Engine

#### Scenario: The Word "Prowly" Can Be Found in Google Search Results  
**Given:** The user is on the Google page  
**And:** The search bar is visible  
**When:** The user types "prowly" in the search bar  
**Then:** The results are displayed  
**And:** Information about the company Prowly is displayed  

---

#### Scenario: The Prowly Logo Is Displayed in the Images Category After Search  
**Given:** The user searches for "Prowly"  
**When:** The user switches to the Images tab  
**Then:** The displayed logos are correct  
**And:** The user can find the latest logo used by the company  

---

#### Scenario: Videos About Prowly Are Displayed in the Videos Category After Search  
**Given:** The user searches for "Prowly"  
**When:** The user switches to the Videos tab  
**Then:** The search results show videos about Prowly  

---
