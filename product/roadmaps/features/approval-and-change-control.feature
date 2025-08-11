Feature: Approval and change control

  Scenario Outline: 4 Eyes approval for high-risk recommendations
    Given <actor1> reviews a high-risk recommendation
    When <actor1> approves the recommendation
    Then <actor2> must also approve before the change is applied

    Examples:
      | actor1 | actor2 |
      | Alice  | Bob    |
      | Carol  | Dave   |

  Scenario: Roll back to previous approved change
    Given Eve has approved a set point change
    When Eve cancels the change
    Then the system should revert to the last approved values

  Scenario: Set system to predefined safe state
    Given Frank wants to ensure safety
    When Frank clicks "Return to safe set points"
    Then the system should apply the predefined safe settings

  Scenario: Mobile alert for change management
    Given Grace approves a change
    When the change is applied
    Then Grace should receive a mobile alert notification
