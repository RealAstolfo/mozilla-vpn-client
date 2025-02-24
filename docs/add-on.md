# Addons

TBD

### Condition object

The condition object contains the following properties:

| Property | Description | Type | Required |
| --- | --- | --- | --- |
| enabledFeatures | An array of features to be enabled | Array of string | No |
| platforms | An array of platforms to be checked | Array of string | No |
| settings | An array of Condition Setting object. See below | Array of Condition Setting object | No |

### Condition Setting object

When a setting must be checked as a condition, the JSON object must contain the following properties:

| Property | Description | Type | Required |
| --- | --- | --- | --- |
| setting | The name of the setting key | String | Yes |
| value | The value of the setting key | String | Yes |
| op | The compare operator: eq or neq | String | Yes |

The list of setting keys can be found here: https://github.com/mozilla-mobile/mozilla-vpn-client/blob/main/src/settingslist.h
