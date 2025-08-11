Feature: Impact screen display

  Scenario Outline: Impact graph displays all data
    Given <actor> loads the Impact screen with data set <data_set>
    When <actor> views the graph
    Then <actor> should see a complete graph

    Examples:
      | actor   | data_set   |
      | Alice   | normal     |
      | Bob     | edge-case  |
      | Carol   | Italtel    |

  Scenario Outline: Impact numbers and colours are correct
    Given <actor> opens the popout and SOL sidebar
    When <actor> compares numbers and colours
    Then <actor> should see accurate values and colours

    Examples:
      | actor   |
      | Dave    |
      | Eve     |

  Scenario Outline: Action object contains required nodes for PM02
    Given <actor> inspects the action object for PM02
    When <actor> checks for nodes
    Then <actor> should see Impact, Simulation, and SLA nodes

    Examples:
      | actor   |
      | Alice   |
      | Bob     |

  Scenario Outline: Impact graph displays for Italtel data
    Given <actor> loads the Impact graph with Italtel data
    When <actor> checks the graph
    Then <actor> should see the graph displayed

    Examples:
      | actor   |
      | Carol   |
      | Dave    |
