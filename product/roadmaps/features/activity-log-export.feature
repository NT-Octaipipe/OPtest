Feature: Activity log export

  Scenario Outline: Export activity log in different formats
    Given <actor> views the activity log
    When <actor> exports the log as <format>
    Then <actor> should receive a file in <format>

    Examples:
      | actor   | format  |
      | Alice   | Excel   |
      | Bob     | CSV     |
      | Carol   | PDF     |

  Scenario: Export empty activity log
    Given Dave views the activity log with no entries
    When Dave exports the log
    Then Dave should receive an empty file
