Feature: Interface and user experience

  Scenario: User views redesigned front end
    Given Alice accesses the OctaiPipe platform
    When Alice views the dashboard
    Then Alice should see the new front end design

  Scenario Outline: Drill down hierarchy for recommendations
    Given <actor> views the facility dashboard
    When <actor> drills down to <level>
    Then <actor> should see recommendations and impacts for <level>

    Examples:
      | actor   | level      |
      | Bob     | building   |
      | Carol   | agent      |
      | Dave    | room       |
