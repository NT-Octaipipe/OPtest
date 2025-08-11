Feature: UI issues and consistency

  Scenario Outline: Completion rate displays correctly
    Given <actor> views the completion rate
    When <actor> triggers calculation
    Then <actor> should see a valid value

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Optimiser Recommendation header layout
    Given <actor> views the Optimiser Recommendation header
    When <actor> resizes the screen to <size>
    Then <actor> should see no overlap with status summary

    Examples:
      | actor   | size    |
      | Carol   | small   |
      | Dave    | large   |

  Scenario Outline: Setpoints display in same order for tickets
    Given <actor> creates tickets with setpoints
    When <actor> views the ticket list
    Then <actor> should see setpoints in the same order

    Examples:
      | actor   |
      | Eve     |
      | Frank   |

  Scenario Outline: UI language consistency for energy savings and SLA status
    Given <actor> reviews UI screens
    When <actor> checks language for energy savings and SLA status
    Then <actor> should see consistent terminology

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Baseline uses configuration
    Given <actor> updates baseline configuration
    When <actor> runs baseline logic
    Then <actor> should see baseline reflect configuration

    Examples:
      | actor   |
      | Carol   |
      | Dave    |

  Scenario Outline: Manually accepted percentage value propagates
    Given <actor> manually accepts a percentage value
    When <actor> checks the system
    Then <actor> should see the value displayed and stored correctly

    Examples:
      | actor   |
      | Eve     |
      | Frank   |

  Scenario Outline: Centre Status "Energy use since last viewed"
    Given <actor> views centre status
    When <actor> triggers "since last viewed" calculation
    Then <actor> should see the value update correctly

    Examples:
      | actor   |
      | Alice   |
      | Bob     |
