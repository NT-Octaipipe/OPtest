Feature: SLA indicators and configuration

  Scenario Outline: Floor plan SLA indicators show true status
    Given <actor> loads the floor plan for zone <zone>
    When <actor> views the SLA indicator
    Then <actor> should see the true SLA status for <zone>

    Examples:
      | actor   | zone   |
      | Alice   | A      |
      | Bob     | B      |
      | Carol   | C      |

  Scenario Outline: SLA risk matches between recommendation and Impact screen
    Given <actor> views a recommendation for zone <zone>
    When <actor> checks the Impact screen
    Then <actor> should see matching SLA risk values

    Examples:
      | actor   | zone   |
      | Dave    | A      |
      | Eve     | B      |

  Scenario Outline: SLA plot boundaries are configurable
    Given <actor> configures SLA plot boundaries
      | boundary_type | value |
      | <type>        | <val> |
    When <actor> views the SLA plot
    Then <actor> should see boundaries set to <val>

    Examples:
      | actor   | type        | val |
      | Alice   | comfortable | 20  |
      | Bob     | close       | 25  |

  Scenario Outline: Zone dropdown appears in Env SLA pane
    Given <actor> opens the Env SLA pane
    When <actor> checks for the zone dropdown
    Then <actor> should see the dropdown and select zone <zone>

    Examples:
      | actor   | zone   |
      | Carol   | A      |
      | Dave    | B      |
