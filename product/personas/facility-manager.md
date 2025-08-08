# Facility Manager

The Data Center Facility Manager is most likely to be the main persona approving temperature set point changes. This role is
directly responsible for operational stability and equipment performance, and facility managers are more familiar with the
technicalities and operational risks associated with HVAC adjustments. Given their close oversight of both HVAC and SLA
compliance, they would be motivated to maintain tight control over set point changes.​



​

## Key UX/UI Considerations:​

​

### Clear Predictive Modelling:​

#### Feature: 
Show predicted impacts in terms of both energy savings and thermal effects on specific areas of the data center.​

#### Consideration: 
Facility Managers need confidence that set point changes will not jeopardize SLA compliance or equipment
longevity. Providing a detailed, scenario-based analysis of the effects on temperature, energy savings, and operational
stability will reinforce their trust.​

​

### Justification and Explanation:​

#### Feature: 
Include a concise, plain-language explanation of why the specific change is recommended, such as how it aligns
with current environmental conditions, occupancy patterns, or energy load demands.​

#### Consideration: 
This promotes transparency and understanding, especially for Facility Managers who may feel cautious
about approving machine-driven recommendations. They will feel more confident if they understand the logic behind each
change.


### Real-Time SLA and Compliance Monitoring:​

#### Feature: 
Display current SLA compliance status and risk assessment for each recommended
change.​

#### Consideration: 
Since SLA breaches can carry heavy penalties, facility managers must be
assured that each adjustment remains within SLA terms. Including real-time SLA monitoring
directly in the interface can support quicker, more confident decisions.​

​

### Safety Margins and Fail-Safes:​

#### Feature: 
Allow users to set safety margins around critical metrics, with notifications if a
recommendation approaches these limits.​

#### Consideration: 
Safety margins add an additional layer of control, giving facility managers the
ability to avoid any set points they deem too close to risk thresholds, helping them avoid potential
thermal breaches.


### Streamlined Approval Process:​

#### Feature: 
One-click approval process, with an option to set automatic approvals within safe
parameters or lower-risk scenarios.​

#### Consideration: 
The approval process should be simple yet customizable, allowing facility
managers to streamline approvals in cases where confidence is high, while retaining more hands-on
control for higher-impact changes.​

#### Constraints
For certain cases, allowing the model to make automatic decisions may
optimize efficiency. However, specific conditions should determine when
automatic actuation is permitted:​

##### Automatic Actuation Conditions:​

###### Stable Operating Range: 
- Automatic adjustments could be allowed if conditions are within a defined “safe zone” of stability, where small fluctuations will not risk SLAs or equipment performance. This could include situations where:​
- - Ambient and internal temperatures are within a certain tolerance range.​
- - Energy demand patterns align with the model’s historical data (e.g., typical usage patterns seasonal norms).​

- High Confidence Scenarios: If the model has consistently high confidence in a
particular recommendation type (e.g., moderate set point adjustments), automatic
actuation might be allowed within pre-set thresholds.​

- Emergency Overrides: The model should be allowed to override thresholds
automatically in response to urgent conditions, such as rapid increases in temperature
beyond typical bounds, which could impact equipment safety or SLAs.

##### Conditions Requiring Manual Approval:​

###### Low Confidence and Anomalous Situations: 
Recommendations with low confidence scores or flagged anomalies should always require manual approval to ensure scrutiny of potentially unstable decisions.​

###### Critical Threshold Adjustments: 
Any adjustments that approach SLA or regulatory thresholds, or recommendations that involve substantial temperature changes, should require manual approval to reduce the risk of breaching comfort or
compliance levels.​

###### First-Time or Novel Scenarios: 
When the model encounters a scenario or data
pattern for which it has limited historical context, it’s beneficial to involve a human
for validation before implementing any changes.​

###### Maintenance and Equipment Wear Considerations: 
If a recommended set point
adjustment could affect equipment longevity (e.g., frequent on-off cycles or large
temperature shifts), manual review by Facility Managers would ensure no adverse
impacts on HVAC equipment life.

​

### Historical Performance and Reporting:​

#### Feature: 
Dashboard with historical data comparing pre- and post-recommendation impacts on
energy consumption, temperature stability, and SLA compliance.​

#### Consideration: 
Facility Managers can use this data to gauge the reliability of the system over time,
improving trust and potentially increasing reliance on the recommendations as they see positive
historical results.

---

## Example BDD Features and Scenarios

### Feature: Approving Temperature Set Point Changes

**Scenario Outline: Approve or reject set point change with varied inputs**
- Given <actor> the Facility Manager reviews a recommended set point change
    | input                  | predicted_savings | risk_level      |
    | <input>                | <savings>         | <risk>          |
- When <actor> views the scenario analysis
- Then <actor> should see <result>

Examples:
    | actor   | input   | savings | risk      | result                                         |
    | Alex    | 22      | 10%     | low       | SLA compliance and equipment longevity are not at risk |
    | Jamie   | 30      | 5%      | high      | warning and reject the change                  |
    | Casey   | banana  |         |           | error about invalid input                      |
    | Morgan  | 24      | 8%      | low       | change auto-approved                           |
    | Taylor  |         |         |           | error about missing input                      |

**Scenario: Interrupt approval process before completion**
- Given Taylor the Facility Manager starts to approve a set point change
- When Taylor closes the approval dialog before confirming
- Then Taylor should see that no change has been made

**Scenario Outline: Approve set point change with automatic/manual conditions**
- Given <actor> the Facility Manager reviews a recommendation
    | condition            | confidence | threshold | scenario_type   |
    | <condition>          | <conf>     | <thresh>  | <type>          |
- When <actor> views the scenario analysis
- Then <actor> should see <result>

Examples:
    | actor   | condition         | conf   | thresh | type      | result                        |
    | Alex    | stable            | high   | safe   | normal    | change auto-approved          |
    | Jamie   | emergency         | high   | breach | override  | change auto-applied automatically |
    | Taylor  | unstable          | low    | near   | anomaly   | prompt for manual approval    |
    | Casey   | novel             | mid    | safe   | first-time| prompt for manual approval    |
    | Jordan  | maintenance       | mid    | safe   | wear      | prompt for manual approval    |

### Feature: Monitoring SLA Compliance

**Scenario Outline: View SLA compliance status after set point change**
- Given <actor> the Facility Manager approves a set point change
    | change_id |
    | <id>      |
- When <actor> views the dashboard
- Then <actor> should see <sla_status>

Examples:
    | actor  | id   | sla_status                |
    | Riley  | 101  | updated SLA compliance    |
    | Sam    | 102  | SLA breach warning        |

**Scenario Outline: Receive notification when safety margin is approached**
- Given <actor> the Facility Manager sets a safety margin
    | margin | threshold |
    | <m>    | <t>       |
- When a recommendation approaches within <delta> of the margin
- Then <actor> should receive <notification>

Examples:
    | actor   | m   | t   | delta | notification         |
    | Jordan  | 2   | 20  | 1     | notification        |
    | Pat     | 0   | 20  | 0     | warning             |

### Feature: Reviewing Historical Performance

**Scenario Outline: Compare pre- and post-recommendation impacts**
- Given <actor> the Facility Manager views the historical dashboard
    | date_range |
    | <range>    |
- When <actor> compares energy consumption before and after a set point change
- Then <actor> should see <report>

Examples:
    | actor | range         | report                                 |
    | Sam   | 2023-01-01    | difference in energy use and stability |
    | Pat   | missing       | message indicating incomplete records  |

### Feature: Predictive Modelling and Impact Display

**Scenario Outline: View predicted impacts for multiple zones**
- Given <actor> the Facility Manager reviews a set point change
    | zones             |
    | <zone_list>       |
- When <actor> views predicted impacts
- Then <actor> should see <impact>

Examples:
    | actor | zone_list           | impact                                 |
    | Alex  | Zone A, Zone B, C   | energy savings and thermal effects     |
    | Jamie | Zone D              | recommendation not to proceed          |

### Feature: Approval Process Customization

**Scenario Outline: Approve multiple changes in one click**
- Given <actor> the Facility Manager selects recommendations
    | recommendations |
    | <count>         |
- When <actor> clicks approve
- Then <actor> should see <result>

Examples:
    | actor  | count | result                        |
    | Jamie  | 3     | all three changes approved    |
    | Morgan | 1     | pre- and post-impact data     |
    | Taylor | 0     | message indicating nothing changed |

### Feature: Historical Performance and Reporting

**Scenario: View historical data for single day**
- Given Morgan the Facility Manager views the dashboard
- When Morgan selects a single day with one recommendation
- Then Morgan should see pre- and post-impact data for that day

**Scenario: View historical data with nonsense date range**
- Given Taylor the Facility Manager enters "yesterday to banana" as the date range
- When Taylor views the dashboard
- Then Taylor should see an error about invalid date range

---

## Additional BDD Features and Scenarios

### Feature: Approval Process Edge Cases

**Scenario: Approve set point change with minimum allowed temperature**
- Given Alex the Facility Manager reviews a recommendation for the lowest allowed temperature
- When Alex views the predicted impacts
- Then Alex should see confirmation that SLA compliance is maintained

**Scenario: Approve set point change with maximum allowed temperature**
- Given Jamie the Facility Manager reviews a recommendation for the highest allowed temperature
- When Jamie views the risk assessment
- Then Jamie should see a warning about SLA risk

**Scenario: Approve multiple set point changes at once**
- Given Morgan the Facility Manager selects five recommendations
- When Morgan clicks approve
- Then Morgan should see all five changes approved

**Scenario: Interrupt approval process after selecting recommendations**
- Given Taylor the Facility Manager selects two recommendations to approve
- When Taylor closes the approval dialog before confirming
- Then Taylor should see that no changes have been made

**Scenario: Submit set point change with empty input**
- Given Casey the Facility Manager leaves the temperature set point blank
- When Casey submits the change
- Then Casey should see an error about missing input

### Feature: SLA Compliance Monitoring Edge Cases

**Scenario: View SLA compliance with zero recommendations**
- Given Riley the Facility Manager views the dashboard with no recommendations
- When Riley checks SLA compliance status
- Then Riley should see a message indicating no changes to review

**Scenario: Receive notification for simultaneous margin breaches**
- Given Jordan the Facility Manager sets safety margins for temperature and humidity
- When recommendations approach both margins at once
- Then Jordan should receive notifications for each metric

**Scenario: View SLA compliance with nonsense input**
- Given Sam the Facility Manager enters "hotdog" as a set point
- When Sam views SLA compliance status
- Then Sam should see an error about invalid input

### Feature: Historical Performance Reporting Edge Cases

**Scenario: View historical data for a day with no recommendations**
- Given Pat the Facility Manager views the dashboard
- When Pat selects a day with no recommendations
- Then Pat should see a message indicating no data available

**Scenario: View historical data with invalid date range**
- Given Alex the Facility Manager enters "tomorrow to yesterday" as the date range
- When Alex views the dashboard
- Then Alex should see an error about invalid date range

**Scenario: Compare historical impacts with only one recommendation**
- Given Jamie the Facility Manager views the historical dashboard
- When Jamie selects a day with a single recommendation
- Then Jamie should see pre- and post-impact data for that day