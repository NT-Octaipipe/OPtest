Feature: API and data correctness

  Scenario Outline: Centre status energy and operational savings use same endpoint
    Given <actor> triggers centre status update
    When <actor> monitors API calls
    Then <actor> should see both savings use the same endpoint

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Action consumption endpoint sums values correctly
    Given <actor> queries the action consumption endpoint
    When <actor> compares summed values to expected
    Then <actor> should see correct sums

    Examples:
      | actor   |
      | Carol   |
      | Dave    |

  Scenario Outline: Baseline predictions match agent predictions
    Given <actor> compares baseline and agent predictions
    When <actor> investigates discrepancies
    Then <actor> should see predictions align

    Examples:
      | actor   |
      | Eve     |
      | Frank   |

  Scenario Outline: Agent requests latest observables including forecasts
    Given <actor> triggers agent request for observables
    When <actor> checks returned data
    Then <actor> should see latest data including forecasts

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Abstracted Mock Data script runs successfully
    Given <actor> runs the mock data script
    When <actor> checks for errors
    Then <actor> should see the script complete successfully

    Examples:
      | actor   |
      | Carol   |
      | Dave    |
