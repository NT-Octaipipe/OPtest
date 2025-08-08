# HVAC Technician

## Background
### Background Profile: 
HVAC Technicians typically have hands-on training or certification in heating, ventilation, and air conditioning systems, often coupled with knowledge of electrical systems and data center-specific equipment. They’re experts in equipment troubleshooting, repairs, and adjustments.​

### Personal Priorities: 
They care about stability and simplicity in their work environment, preferring technology that’s straightforward and easy to maintain. They are personally motivated by getting things right the first time and minimizing the need for complex troubleshooting.​

### View on Technology: 
Generally cautious, as they value reliability and may be wary of technology that seems complex or difficult to maintain.
However, they appreciate tools that make it easier to perform tasks, streamline workflows, or diagnose issues faster.​

### Likelihood to Champion or Object: 
Likely to be cautious adopters. They will appreciate the technology if it proves dependable, reduces maintenance tasks, and fits seamlessly into existing workflows. However, they might resist if it adds perceived complexity or additional responsibilities.​

### Key KPIs: 
Response and repair times for HVAC issuesMaintenance cycles and equipment reliabilityAbility to maintain stable thermal conditions Downtime avoidance and quick resolution rates


## Drivers
Technicians aim to maintain consistent HVAC performance and prevent downtime. They value operational stability and clear, actionable insights that enable prompt adjustments to HVAC systems.

## Frustrations
Complex interfaces, unclear recommendations, or systems that require multiple steps for simple actions.​

## Wants
Direct control over temperature adjustments, an easy-to-read interface for quick system assessments, and minimized troubleshooting needs.​

## Concerns
Any changes leading to potential equipment stress, increased maintenance requirements, or reduced reliability over time.​

## UX/UI Considerations
### Direct, Action-Oriented Layout: 
An intuitive, task-oriented UI with quick access to set point adjustments and diagnostics.​

### Clear, Actionable Recommendations: 
Simple, actionable recommendations with one-click approval for temperature adjustments.​

### Maintenance Insights: 
Integration with maintenance alerts and potential impact summaries for each recommended action, helping to assess long-term effects on equipment.

---

## Example BDD Features and Scenarios

### Feature: Direct Temperature Adjustment

**Scenario Outline: Adjust temperature with edge and nonsense values**
- Given <actor> the HVAC Technician enters a temperature value
    | value      |
    | <input>    |
- When <actor> submits the adjustment
- Then <actor> should see <result>

Examples:
    | actor   | input    | result                              |
    | Chris   | 10       | confirmation of the change          |
    | Pat     | 40       | warning about equipment stress      |
    | Jamie   | pizza    | error about invalid input           |
    | Alex    |          | error about missing value           |
    | Riley   | -10      | error about invalid input           |
    | Sam     | 1000     | error about invalid input           |
    | Jordan  | 0        | warning about equipment stress      |

**Scenario: Interrupt adjustment before confirmation**
- Given Morgan the HVAC Technician starts to adjust the temperature
- When Morgan closes the adjustment dialog before confirming
- Then Morgan should see that no change has been made

**Scenario Outline: Approve temperature adjustment for multiple zones**
- Given <actor> the HVAC Technician selects zones for adjustment
    | zones         |
    | <zone_list>   |
- When <actor> submits the changes
- Then <actor> should see confirmation for each zone

Examples:
    | actor | zone_list         |
    | Alex  | Zone A, Zone B    |
    | Pat   | Zone C            |

### Feature: Maintenance Insights and Alerts

**Scenario Outline: View maintenance alert with data variations**
- Given <actor> the HVAC Technician reviews a recommendation
    | maintenance_data |
    | <data>          |
- When <actor> views the alert
- Then <actor> should see <result>

Examples:
    | actor  | data     | result                        |
    | Taylor | valid    | potential impact on reliability|
    | Casey  | missing  | message about missing info     |
    | Pat    | banana   | error about invalid data       |

**Scenario: Dismiss maintenance alert before reading**
- Given Chris the HVAC Technician receives a maintenance alert
- When Chris closes the alert before reading
- Then Chris should see the alert marked as unread

### Feature: Quick System Assessment

**Scenario Outline: View system status with issue count**
- Given <actor> the HVAC Technician views the dashboard
- When <actor> checks for system issues
- Then <actor> should see <result>

Examples:
    | actor  | result                          |
    | Sam    | message: all systems stable     |
    | Jordan | summary of the issue            |
    | Alex   | list of all current issues      |
    | Morgan | message: all systems stable     |

**Scenario: View system status with nonsense filter**
- Given Jamie the HVAC Technician enters "unicorn" as a filter
- When Jamie views the dashboard
- Then Jamie should see an error about invalid filter

### Feature: Actionable Recommendations

**Scenario Outline: Approve recommendations with lifecycle variations**
- Given <actor> the HVAC Technician selects recommendations
    | recommendations |
    | <count>         |
- When <actor> clicks approve
- Then <actor> should see <result>

Examples:
    | actor  | count | result                        |
    | Pat    | 1     | recommendation applied        |
    | Chris  | 5     | all five recommendations applied|
    | Taylor | 0     | message: nothing was changed  |

**Scenario: Reject recommendation due to complexity**
- Given Jamie the HVAC Technician reviews a recommendation with unclear instructions
- When Jamie views the details
- Then Jamie should see an option to reject the recommendation

**Scenario: Approve recommendation with missing instructions**
- Given Casey the HVAC Technician reviews a recommendation with missing instructions
- When Casey clicks approve
- Then Casey should see a warning about incomplete information

**Scenario: Approve one recommendation, then undo**
- Given Riley the HVAC Technician approves a recommendation
- When Riley clicks undo
- Then Riley should see the recommendation reverted

**Scenario: Approve recommendations, then interrupt process**
- Given Sam the HVAC Technician selects two recommendations to approve
- When Sam closes the approval dialog before confirming
- Then Sam should see that no recommendations were applied