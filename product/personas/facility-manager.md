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

**Scenario: Approve set point change with clear predicted savings**
- Given Alex the Facility Manager reviews a recommended set point change with predicted energy savings of 10%
- When Alex views the scenario analysis for thermal effects in Zone A
- Then Alex should see that SLA compliance and equipment longevity are not at risk

**Scenario: Reject set point change due to high risk**
- Given Jamie the Facility Manager reviews a recommended set point change with predicted temperature near SLA threshold
- When Jamie views the risk assessment
- Then Jamie should see a warning and reject the change

**Scenario: Approve set point change with automatic approval enabled**
- Given Morgan the Facility Manager has enabled automatic approvals for low-risk changes
- When Morgan receives a recommendation within safe parameters
- Then Morgan should see the change auto-approved

**Scenario: Interrupt approval process before completion**
- Given Taylor the Facility Manager starts to approve a set point change
- When Taylor closes the approval dialog before confirming
- Then Taylor should see that no change has been made

**Scenario: Approve set point change with nonsense input**
- Given Casey the Facility Manager enters "banana" as the temperature set point
- When Casey submits the change
- Then Casey should see an error about invalid input

**Scenario: Approve set point change in stable operating range**
- Given Alex the Facility Manager reviews a recommendation within the defined safe zone
- When Alex views the scenario analysis
- Then Alex should see the change auto-approved

**Scenario: Approve set point change with high confidence**
- Given Morgan the Facility Manager reviews a moderate set point adjustment with high model confidence
- When Morgan views the recommendation
- Then Morgan should see the change auto-approved

**Scenario: Emergency override triggers automatic actuation**
- Given Jamie the Facility Manager reviews a recommendation during a rapid temperature increase
- When Jamie views the emergency override alert
- Then Jamie should see the change auto-applied automatically

**Scenario: Manual approval required for low confidence**
- Given Taylor the Facility Manager reviews a recommendation flagged with low confidence
- When Taylor views the risk assessment
- Then Taylor should see a prompt for manual approval

**Scenario: Manual approval required for critical threshold adjustment**
- Given Casey the Facility Manager reviews a recommendation near the SLA threshold
- When Casey views the scenario analysis
- Then Casey should see a prompt for manual approval

**Scenario: Manual approval required for novel scenario**
- Given Riley the Facility Manager reviews a recommendation for a first-time data pattern
- When Riley views the explanation
- Then Riley should see a prompt for manual approval

**Scenario: Manual approval required for maintenance consideration**
- Given Jordan the Facility Manager reviews a recommendation that may affect equipment longevity
- When Jordan views the maintenance warning
- Then Jordan should see a prompt for manual approval

### Feature: Monitoring SLA Compliance

**Scenario: View real-time SLA status after set point change**
- Given Riley the Facility Manager approves a set point change
- When Riley views the dashboard
- Then Riley should see updated SLA compliance status

**Scenario: Receive notification when safety margin is approached**
- Given Jordan the Facility Manager sets a safety margin of 2°C below SLA threshold
- When a recommendation approaches within 1°C of the margin
- Then Jordan should receive a notification

### Feature: Reviewing Historical Performance

**Scenario: Compare pre- and post-recommendation impacts**
- Given Sam the Facility Manager views the historical dashboard
- When Sam compares energy consumption before and after a set point change
- Then Sam should see a report showing the difference in energy use and temperature stability

**Scenario: View historical data with missing entries**
- Given Pat the Facility Manager views the historical dashboard
- When Pat selects a date range with missing data
- Then Pat should see a message indicating incomplete records

---

## Additional BDD Features and Scenarios

### Feature: Predictive Modelling and Impact Display

**Scenario: View predicted impacts for multiple zones**
- Given Alex the Facility Manager reviews a set point change
- When Alex views predicted impacts for Zone A, Zone B, and Zone C
- Then Alex should see energy savings and thermal effects for each zone

**Scenario: View predicted impacts with zero expected savings**
- Given Jamie the Facility Manager reviews a set point change
- When Jamie views the scenario analysis showing 0% energy savings
- Then Jamie should see a recommendation not to proceed

**Scenario: View predicted impacts with maximum allowed temperature**
- Given Morgan the Facility Manager reviews a set point change to the highest allowed temperature
- When Morgan views the predicted impacts
- Then Morgan should see a warning about possible SLA risk

### Feature: Justification and Explanation

**Scenario: View plain-language explanation for recommendation**
- Given Taylor the Facility Manager reviews a recommended change
- When Taylor views the explanation
- Then Taylor should see how the change aligns with occupancy and energy load

**Scenario: View explanation for recommendation with ambiguous data**
- Given Casey the Facility Manager reviews a recommendation based on incomplete occupancy data
- When Casey views the explanation
- Then Casey should see a note about missing data

### Feature: SLA and Compliance Monitoring

**Scenario: View SLA compliance status for multiple recommendations**
- Given Riley the Facility Manager reviews three recommended changes
- When Riley views the SLA compliance status for each
- Then Riley should see which changes are within SLA and which are not

**Scenario: View SLA compliance with nonsense input**
- Given Jordan the Facility Manager enters "hotdog" as a set point
- When Jordan views SLA compliance status
- Then Jordan should see an error about invalid input

### Feature: Safety Margins and Notifications

**Scenario: Set safety margin to zero**
- Given Sam the Facility Manager sets the safety margin to 0°C
- When Sam reviews a recommendation at the SLA threshold
- Then Sam should receive a warning

**Scenario: Receive notification for multiple margin breaches**
- Given Pat the Facility Manager sets safety margins for temperature and humidity
- When recommendations approach both margins
- Then Pat should receive notifications for each metric

### Feature: Approval Process Customization

**Scenario: Enable automatic approval for all changes**
- Given Alex the Facility Manager enables automatic approval for all recommendations
- When Alex receives a high-risk recommendation
- Then Alex should see a prompt to manually review

**Scenario: Approve multiple changes in one click**
- Given Jamie the Facility Manager selects three recommendations
- When Jamie clicks approve
- Then Jamie should see all three changes approved

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