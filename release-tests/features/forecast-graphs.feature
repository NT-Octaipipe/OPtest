Feature: Forecast and energy graphs

  Scenario Outline: Render forecast and impact lines at correct timepoints
    Given <actor> loads the forecast graph
    When <actor> views the impact line at timepoint <time>
    Then <actor> should see the impact line rendered at <time>

    Examples:
      | actor   | time      |
      | Alice   | 00:00     |
      | Bob     | 12:00     |
      | Carol   | 23:59     |

  Scenario Outline: Power Forecast graph across midnight
    Given <actor> views the Power Forecast graph
    When the time crosses midnight
    Then <actor> should see the graph display correctly

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Hover text visibility on Power Forecast graph
    Given <actor> hovers over a point on the Power Forecast graph
    When <actor> looks for hover text
    Then <actor> should easily find the hover text

    Examples:
      | actor   |
      | Carol   |
      | Dave    |

  Scenario Outline: Energy Forecast graph stack order
    Given <actor> views the Energy Forecast graph
    When <actor> checks the stack order
    Then <actor> should see the correct stacking

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Energy Forecast graph labelling
    Given <actor> views the Energy Forecast graph
    When <actor> checks the labels
    Then <actor> should see clear and accurate labels

    Examples:
      | actor   |
      | Carol   |
      | Dave    |

  Scenario Outline: Plot consumption bin with End on x axis
    Given <actor> views the Energy Forecast graph
    When <actor> checks the x axis
    Then <actor> should see "End" label

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Clamp logic in forecast graph
    Given <actor> views the forecast graph
    When <actor> triggers edge case values
    Then <actor> should see correct clamping behavior

    Examples:
      | actor   |
      | Carol   |
      | Dave    |
