Feature: System integration

  Scenario: Integrate BACnet messaging bus
    Given Alice enables BACnet support
    When Alice sends a message to the cooling system
    Then the message should be received via BACnet

  Scenario Outline: Map possible room values
    Given <actor> views room values in <system_part>
    When <actor> requests mapping
    Then <actor> should see all possible values for <system_part>

    Examples:
      | actor   | system_part   |
      | Bob     | cooling zone  |
      | Carol   | server room   |
