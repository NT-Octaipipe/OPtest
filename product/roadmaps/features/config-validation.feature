Feature: Config validation and migration

  Scenario Outline: Validate configuration before migration
    Given <actor> prepares a config for migration
    When <actor> validates the config
    Then <actor> should see a validation result

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario: Migrate to next version with valid config
    Given Carol has a valid config
    When Carol migrates to the next version
    Then the migration should succeed

  Scenario: Migrate with invalid config
    Given Dave has an invalid config
    When Dave attempts migration
    Then Dave should see an error message
