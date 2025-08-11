Feature: Monitoring and logging

  Scenario Outline: View container logs in portal
    Given <actor> accesses the portal
    When <actor> views container logs for <service>
    Then <actor> should see logs for <service>

    Examples:
      | actor   | service         |
      | Alice   | RL Agent        |
      | Bob     | E+ Model        |
      | Carol   | Monitoring      |

  Scenario: Monitor data quality and drift
    Given Dave enables data quality monitoring
    When the system detects drift
    Then Dave should receive a notification

  Scenario: Monitor RL and E+ agent behaviour
    Given Eve deploys RL and E+ agents
    When Eve views the monitoring dashboard
    Then Eve should see agent status and performance metrics
