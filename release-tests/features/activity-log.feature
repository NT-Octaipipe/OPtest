Feature: Activity log functionality

  Scenario Outline: Filter activity log entries
    Given <actor> opens the activity log
    When <actor> applies filters
      | filter_type | filter_value |
      | <type>      | <value>     |
    Then <actor> should see entries matching the filters

    Examples:
      | actor   | type     | value      |
      | Alice   | user     | Alice      |
      | Bob     | action   | export     |
      | Carol   | date     | 2024-06-01 |
      | Dave    | status   | success    |

  Scenario Outline: Activity log paging
    Given <actor> has many activity log entries
    When <actor> navigates to page <page>
    Then <actor> should see entries for page <page>

    Examples:
      | actor   | page |
      | Alice   | 1    |
      | Bob     | 2    |
      | Carol   | 10   |

  Scenario Outline: Export activity log
    Given <actor> applies filters
      | filter_type | filter_value |
      | <type>      | <value>     |
    When <actor> exports the activity log
    Then <actor> should receive a file containing the filtered entries

    Examples:
      | actor   | type   | value   |
      | Alice   | user   | Alice   |
      | Bob     | status | error   |

  Scenario Outline: Activity log records correct user
    Given <actor> performs an action
    When <actor> views the activity log
    Then <actor> should see their name recorded for the action

    Examples:
      | actor   |
      | Alice   |
      | Bob     |
