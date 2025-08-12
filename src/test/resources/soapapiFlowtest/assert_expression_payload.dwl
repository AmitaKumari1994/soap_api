%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "output": {
    "sISOCode": "PA",
    "sName": "Panama",
    "sCapitalCity": "Panama",
    "sPhoneCode": "507",
    "sContinentCode": "AM",
    "sCurrencyISOCode": "PAB",
    "sCountryFlag": "http://www.oorsprong.org/WebSamples.CountryInfo/Flags/Panama.jpg",
    "Languages": {
      "tLanguage": {
        "sISOCode": "es",
        "sName": "Spanish"
      }
    }
  },
  "status": "successful"
})